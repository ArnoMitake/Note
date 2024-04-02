# JavaSour 中華長訊分則序號與中心長訊序號重複BUG修正

## 測試先須知
* [表單](https://drive.mitake.com.tw/oo/r/xt4xIPeWAy7Xf68q3CqDNh7Wgm9cRXZO)
* 測試內容如下:
```
協助所有業者(中華(有1跟G開頭)、遠傳、台哥、台灣簡訊、中華國際及中信國際)sour都測試以下案例：
1.	有正常撈取待發送資料
2.	有收到udp trigger
另外，多測一個寫入SMSourNew的case，同時寫入相同SerialNo但不同業者MID，能否正常寫入成功。
```
* 本次測試都在.38上
* 調整 台哥(TAI) -> SMSourTAI_3000
* 新增 台簡(TWSMS) -> SMSourTAI_8001
* 調整 中華國際(CCNET) -> SMSourTAI_9001

## 測試流程
1. 先確認發送的DB(例:SMS2)
2. 查看 DB 的 SMUser 找發送者的 UserName -> 記住 GroupID(會一直用到)
3. 去 DBexp 的 SMGroupRoute 找對應的 GroupID 然後看有沒有對應的UserName，沒有就看只有Route(預設)
4. 去 DBexp 的 SMRoute 找對應的 Route 會有對照表按照手機號碼發送會對應到指定的特碼
5. 以上如果找不道但發送成功可以找一張表 DBexp 的 table(GroupID) 可以看到發送的資料
6. 去 DBexp 的 MidSMSourConfig 會有對應的 Mid 和 PartKey
   1. 備註: 各業者對應的 Mid 可以找 DBexp 的 SMSourNew 裡面的 TRIGGER 會有 insert 對應的業者
7. 改特碼可以參考第6步驟調整 SMRoute，如果沒有符合的Mid直接去改MidSMSourConfig

```
台哥的測試比較麻煩 須調整以下檔案
(中華、遠傳都有一個 Test_Server)
System_Service.cfgBean.xml
找到 <!-- Mock模式 --> 調整如下

<!-- 
	<bean id="TAIPushService" class="com.mitake.smsour.service.impl.TAIPushService">
		<property name="smSourDao" ref="SMSourDao" />
		<property name="serviceWrapper" ref="TAISmsServiceWrapper" />
	</bean>
 -->
	<!-- Mock模式 -->
	
	<bean id="TAIPushService" class="com.mitake.smsour.service.impl.TAIPushServiceMock">
		<property name="smSourDao" ref="SMSourDao" />
		<property name="serviceWrapper" ref="TAISmsServiceWrapper" />
		<property name="pushFailRate" value="0" />
	</bean>
```

## 有正常撈取待發送資料
* 發送完成後看 DBexp 的 table(GroupID) 有無資料
* 發送的DB 的 MsgInfo 有無資料
* 長訊的話還有log .38 D:\SMS\MSG2\MitakePushClientLmPost_MSG

## 有收到udp trigger
* 上 .38 確認當下發送的業者和特碼 (例:SMSourTAI3000) 到 D:\JAVA_AP\SMSourTAI_3000\SMSourTAI3000\SMSourTAI3000_CamelWorkLog.log
* 確認log有無以下內容，eventType=OUTSIDE 例如:
```
2024/04/02 10:00:46.004 [NioProcessor-3] [] INFO  MidUDPClientMang[sourCountEventNotify:358] - 發出事件通報SourCountEventModel hashCode=861229545, eventType=OUTSIDE, mid=T0002
2024/04/02 10:00:46.005 [NioProcessor-3] [] INFO  SourCountNotifyOrder[notifySourCountEvent:128] - 接收事件通報notifySourCountEvent hashCode=861229545, eventType=OUTSIDE, mid=T0002
```
* 如果找不到可以去 .38 D:\JAVA_AP\JavaSmSourMonitor\log\JavaSmSourMonitor 查看log有無資料

## 測試曾碰到的先記錄
* DBexp
  * SMUser
  * SMRoute
  * MSG
  * SMGroupRoute
  * SMGroup
  * SMSourNew
  * MidSMSourConfig
* SMS2
  * MsgInfo
  * LongSourWork
  * SpLmPost
  * SpLmPost2

## API
* http://10.99.0.38:7316/SmSend?smbody=TAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms testTAI longsms test&dstaddr=0901000000&username=miutest1&password=12345