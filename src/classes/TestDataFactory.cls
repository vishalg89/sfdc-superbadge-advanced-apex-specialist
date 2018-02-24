/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
 **/
public with sharing class TestDataFactory {

  /**
   * @name ConstructCollaborationGroup
   * @description
   **/
  public void ConstructCollaborationGroup(){
    //ToDo: Ensure this method returns a single Chatter CollaborationGroup
    //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
    //    and configured so anyone can join, see and post updates.
  }

  /**
   * @name CreateProducts
   * @description Constructs a list of Product2 records for unit tests
   **/
  public void ConstructProducts(Integer cnt){
    //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
    //  with all the required fields populated
    //  and IsActive = true
    //  an Initial Inventory set to 10
    //  and iterating through the product family picklist values throughout the list.
  }

  /**
   * @name CreatePricebookEntries
   * @description Constructs a list of PricebookEntry records for unit tests
   **/
  public void ConstructPricebookEntries(List<Product2> prods){
    //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
    //  related to the provided Products
    //  with all the required fields populated
    //  and IsActive = true
    //  and belonging to the standard Pricebook
  }

  /**
   * @name CreateAccounts
   * @description Constructs a list of Account records for unit tests
   **/
  public void ConstructAccounts(Integer cnt){
    //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
    //  with all of the required fields populated.
  }

  /**
   * @name CreateContacts
   * @description Constructs a list of Contacxt records for unit tests
   **/
  public void ConstructContacts(Integer cnt, List<Account> accts){
    //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
    //  related to the provided Accounts
    //  with all of the required fields populated.
  }

  /**
   * @name CreateOrders
   * @description Constructs a list of Order records for unit tests
   **/
  public void ConstructOrders(Integer cnt, List<Account> accts){
    //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
    //  related to the provided Accounts
    //  with all of the required fields populated.
  }

  /**
   * @name CreateOrderItems
   * @description Constructs a list of OrderItem records for unit tests
   **/
  public void ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords){
    //ToDo: Ensure this method returns a list of size cnt of OrderItem records
    //  related to the provided Pricebook Entries
    //  and related to the provided Orders
    //  with all of the required fields populated.
    //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
  }

  /**
   * @name SetupTestData
   * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
   **/
  public void InsertTestData(Integer cnt){
    //ToDo: Ensure this method calls each of the construct methods
    //  and inserts the results for use as test data.

  }

}
