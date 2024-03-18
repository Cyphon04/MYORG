public class WrapperFetchData {
    public static void myMethod(){
    	String jsonString = '[{"totalPrice":5,"statementDate":"2023-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":1,"Quantity":5,"ProductName":"Apex"},{"UnitPrice":5,"Quantity":1,"ProductName":"Hours"}],"invoiceNumber":1},{"totalPrice":15,"statementDate":"2023-10-04T16:58:54.858Z","lineItems":[{"UnitPrice":6,"Quantity":1,"ProductName":"WrapperClass"}],"invoiceNumber":2}]';

        List<MyWrapper> amyWrapper = (List<MyWrapper>)JSON.deserialize(jsonString,List<MyWrapper>.class);
    
    	System.debug(amyWrapper[0].totalPrice);
    	//System.debug(amyWrapper.invoiceList[1].totalPrice);
       // System.debug(amyWrapper.invoiceList[0].totalPrice);
       // System.debug(amyWrapper.invoiceList[1].totalPrice);
        
    }
}