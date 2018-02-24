@isTest
private class Product2Tests {

  @isTest static void Product2Extension_UnitTest(){

    PageReference pageRef = Page.Product2New;
    Test.setCurrentPage(pageRef);

    Product2 prod = new Product2(name='Test',isActive=true);
    ApexPages.StandardController stdcontroller = new ApexPages.StandardController(prod);

    Product2Extension ext = new Product2Extension(stdcontroller);
    System.assertEquals(Constants.DEFAULT_ROWS, ext.productsToInsert.size());

    ext.addRows();
    System.assertEquals(Constants.DEFAULT_ROWS * 2, ext.productsToInsert.size());

    for (Integer i = 0; i < 5; i++) {
      Product2Extension.ProductWrapper wrapper = ext.productsToInsert[i];

      Product2 p = new Product2();
      p.Name = 'Test Product ' + i;
      p.IsActive = true;
      p.Initial_Inventory__c = 20;
      p.Family = Constants.PRODUCT_FAMILY[0].getValue();
      wrapper.productRecord = p;

      PricebookEntry pbe = new PricebookEntry();
      pbe.IsActive = true;
      pbe.UnitPrice = 10;
      wrapper.pricebookEntryRecord = pbe;
    }

    Test.startTest();
    ext.save();
    Test.stopTest();

    ext.GetFamilyOptions();
    ext.GetInventory();
    List<Product2> createdProducts = [SELECT Id FROM Product2];
    System.assertEquals(5, createdProducts.size());
  }

}
