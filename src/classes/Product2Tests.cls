@isTest (seeAllData=true)
private class Product2Tests {

    /**
     * @name product2Extension_UnitTest
     * @description UnitTest for product2Extension
    **/
    static TestMethod void Product2Extension_UnitTest(){
        Test.startTest();
            Product2Extension ext = new Product2Extension();
            ext.addRows();
            ext.save();
        Test.stopTest();
    }

}