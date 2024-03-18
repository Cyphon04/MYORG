public class CustomNotification {
    public static void myNotification()
    {
        CustomNotificationType notify = [SELECT Id , DeveloperName FROM CustomNotificationType WHERE DeveloperName = 'MyNewNotification'];
        
        List<Account> accList = [SELECT Name FROM Account];
        
        User mUser = [SELECT Id , Name FROM User WHERE Name = 'Harsh Sharma'];
        System.debug('mUser'+mUser.Name+' ID-->'+mUser.Id);
        
        List<Messaging.CustomNotification> notificationList = new List<Messaging.CustomNotification>();
        
        // Storing Id in  Set as Send Function  Takes Set as Param
        Set<String> userId = new Set<String>();
        userId.add(String.valueOf(mUser.Id));
        
        for(Account acc : accList)
        { 
            Messaging.CustomNotification notification = new Messaging.CustomNotification();
            notification.setTitle('Custom Notification--->'+acc.Name);
            notification.setBody('Hey-->'+acc.Name);
            notification.setNotificationTypeId(notify.Id);
            //Record Id of Account Record of Steve Smith in My Org 
            notification.setTargetId('0015g00001X0rThAAJ');
            notification.send(userId);
        }
    }
}