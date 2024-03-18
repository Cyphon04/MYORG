public class CampaignHelper {
    public static void CampaignNameSuffix(List<Campaign> campaigns)
    {
        for(Campaign camp : campaigns)
        {
            camp.Name += ' Fair'; 
        }
    }
}