/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 02-25-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class stripeapi {
    @future(callout=true)
    public static void makestripeapiCallout(String str) {

        System.debug('Method Call Hua Hai');
        HttpRequest request = new HttpRequest();
        HTTP http = new Http();

        String Endpoint = 'https://api.stripe.com/v1/checkout/sessions';
        String  API_Key = 'sk_test_51NBZI3SBIlnPw2h4WPuxrPo6XEXi1SZti6QTZf5A6sBMG5aCZwGQSAP1OwxluVjAN9z2kQCVfiIjzSgRc75qIoah00wDALFkol';
        String encodedData = 'cancel_url='+EncodingUtil.urlEncode('https://example.com/cancel','UTF-8') + 'success_url='+EncodingUtil.urlEncode('https://example.com/cancel', 'UTF-8') + 'line_items[0][price_data][unit_amount]=' + EncodingUtil.urlEncode('2000', 'UTF-8') + 'line_items[0][quantity]='+EncodingUtil.urlEncode('3', 'UTF-8') + 'mode' + EncodingUtil.urlEncode('payment', 'UTF-8') + 'payment_method_types[0]='+EncodingUtil.urlEncode('card', 'UTF-8');


        request.setMethod('POST ');
        request.setEndpoint(Endpoint);
        request.setHeader('Authorization','Bearer '+API_Key);
        request.setHeader('Content-Type','application/x-www-form-urlencoded');
        request.setBody(encodedData);

        HttpResponse response = http.send(request);

        System.debug('Response Data'+response.getBody());
    }
}