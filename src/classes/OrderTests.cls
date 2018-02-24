@isTest
public class OrderTests {

  @testSetup static void SetupTestData(){
    TestDataFactory.InsertTestData(1);
  }


  @isTest static void OrderUpdate_UnitTest(){

    Test.startTest();
    Order o = [SELECT Id, Status FROM Order LIMIT 1];
    Product2 p = [SELECT Id, Family, Name, Quantity_Ordered__c, Quantity_Remaining__c FROM Product2 LIMIT 1];

    o.status = constants.ACTIVATED_ORDER_STATUS;
    Update o;
    Product2 updatedp = [SELECT Id, Family, Name, Quantity_Ordered__c, Quantity_Remaining__c FROM Product2 LIMIT 1];


    TestDataFactory.VerifyQuantityOrdered(p, updatedp, constants.DEFAULT_ROWS);
    Test.stopTest();

  }

}
