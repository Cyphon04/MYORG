public class MyWrapper {
    //public cls_invoiceList[] invoiceList;
    
    //class cls_invoiceList{
        public Integer totalPrice;
    	public String statementDate;
        public lineItem[] lineItems;
        public Integer invoiceNumber;
    //}
    
    class lineItem{
        public Integer UnitPrice;
        public Integer Quantity;
        public String ProductName;
    }
    
    // Public Static Class
  /*  public static MyWrapper parseData(String json)
    {
        return (MyWrapper) System.JSON.deserialize(json, MyWrapper.class);
    }*/
}