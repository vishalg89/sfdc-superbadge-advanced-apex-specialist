/**
 * @name PackageTests
 * @description This class provide test coverage for code included in the unmanaged package
**/
@isTest
private class PackageTests {


    /**
     * @name chartHelper_UnitTest
     * @description Test coverage for the packaged version of the chartHelper class
    **/
    static TestMethod void chartHelper_UnitTest(){
        chartHelper.chartData c = new chartHelper.chartData('test',1);
    }

    /**
     * @name orderTrigger_UnitTest
     * @description Test coverage for the packaged version of the orderTrigger and orderHelper class
    **/
    static TestMethod void orderTrigger_UnitTest(){
        Test.startTest();
            Id standardPricebookId = test.getStandardPricebookId();
            orderHelper.afterUpdate(new List<Order>(), new List<Order>());
            orderHelper.rollUpOrderItems(new Set<Id>());
            Product2 testProduct = new Product2(Name='Test',isActive=true,Family='Entree',Initial_Inventory__c=21);
            insert testProduct;
            PricebookEntry testPricebookEntry = new PricebookEntry(Product2Id=testProduct.Id,Pricebook2Id=standardPricebookId,UnitPrice=1);
            insert testPricebookEntry;

            testProduct.Quantity_Ordered__c = 1;
            update testProduct;

            Account testAccount = new Account(Name='Test');
            insert testAccount;

            Order testOrder = new Order();
            testOrder.AccountId = testAccount.Id;
            testOrder.EffectiveDate = date.newInstance(2017,1,1);
            testOrder.Status = 'Draft';
            testOrder.Pricebook2Id = standardPricebookId;
            insert testOrder;

            OrderItem testOrderItem = new OrderItem();
            testOrderItem.OrderId = testOrder.Id;
            testOrderItem.PricebookEntryId = testPricebookEntry.Id;
            testOrderItem.Quantity = 1;
            testOrderItem.UnitPrice = 1;
            insert testOrderItem;

            delete testOrder;
            undelete testOrder;

            testOrder.Status = 'Activated';
            update testOrder;
        Test.stopTest();
    }

    /**
     * @name product2Helper_UnitTest
     * @description Test coverage for the packaged version of the product2Helper class
    **/
    static TestMethod void product2Helper_UnitTest(){
        Test.startTest();
            Product2 testProduct = new product2(Name='Test',Family='Entree',Initial_Inventory__c=0);
            insert testProduct;
            product2Helper.afterUpdate();
            product2Helper.postAlerts(new List<Product2>{testProduct});
        Test.stopTest();
    }

    /**
     * @name product2Extension_UnitTest
     * @description Test coverage for the packaged version of the product2Extension class
    **/
    static TestMethod void product2Extension_UnitTest(){
        Test.startTest();
            product2Extension ext = new product2Extension();
            ext.getInventory();
            ext.addRows();
            ext.save();
        Test.stopTest();
    }

    /**
     * @name announcementQueueable_UnitTest
     * @description Test coverage for the packaged version of the announcementQueueable class
    **/
    static TestMethod void announcementQueueable_UnitTest(){
        Test.startTest();
            List<ConnectApi.AnnouncementInput> announcements = new List<ConnectApi.AnnouncementInput>();
            announcementQueueable cls = new announcementQueueable();
            cls.toPost = announcements;
            try {
                announcementQueueable.postAnnouncements(announcements);
            } catch ( Exception e ){

            }
        Test.stopTest();
    }

    /**
     * @name orderExtension_UnitTest
     * @description Test coverage for the packaged version of the orderExtension
    **/
    static TestMethod void orderExtension_UnitTest(){
        Test.startTest();
            Account testAccount = new Account(Name='Test');
            insert testAccount;
            Contact testContact = new Contact(LastName='Test',AccountId=testAccount.Id);
            insert testContact;
            Order testOrder = new Order(AccountId=testAccount.Id,EffectiveDate=system.today(),Status='Draft');
            insert testOrder;
            orderExtension ext = new orderExtension(new ApexPages.standardController(testOrder));
            ext.getFamilyOptions();
            ext.onFieldChange();
            ext.save();
            ext.selectFamily();
            ext.first();
            ext.next();
            ext.previous();
            ext.last();
            ext.getHasPrevious();
            ext.getHasNext();
            ext.getTotalPages();
            ext.getPageNumber();
        Test.stopTest();
    }

}