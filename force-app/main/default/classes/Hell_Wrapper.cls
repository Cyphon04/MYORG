public class Hell_Wrapper {
    public accountValues[] Account ;
    
    public class accountValues{
        public String name;
        public String company_external_system_id;
        public String External_last_modified_datetime;
        public oppValues[] Opportunities;
    }
    
    public class oppValues{
        public String Name;
        public String Amount;
        public String Stage;
        public String LeadSource;
        public String external_system_id_c;
        public String external_last_modified_datetime_c;
    }
    
}