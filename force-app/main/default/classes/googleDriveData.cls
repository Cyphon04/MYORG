public class googleDriveData {
    public String kind;
    public Boolean incompleteSearch;
    public List<Files> files;
    public class Files {
        public String kind;
        public String mimeType;
        public String id;
        public String name;
    }   
    public static GoogleDriveData parse(String json) {
        return (GoogleDriveData) System.JSON.deserialize(json, GoogleDriveData.class);
    }
}