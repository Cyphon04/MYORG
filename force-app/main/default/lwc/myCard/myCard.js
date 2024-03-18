import { LightningElement, wire, track } from "lwc";
import getAccounts from "@salesforce/apex/GenerateData.fetchAccounts";
import getContactRecords from "@salesforce/apex/GenerateData.getContactRecords";
import moreObjectData from "@salesforce/apex/MyClass.moreObjectData";
const PAGE_SIZE = 5;
export default class MyCard extends LightningElement {
  //Lazy Loading Logic

  visibleData = [];
  isLoading = false;
  currentPage = 0;
  totalRecords = 0;
  heightAttribute;
  styleAttribute;

  connectedCallback() {
    console.log("Connct Call Hui ");
    this.loadMoreData();

    moreObjectData()
      .then((res) => {
        console.log("Result in Connected Callback is Here", res);
      })
      .catch((err) => {
        console.log("Some Error is Here");
      });

    // Setting Height for Component
    console.log("Iske pehle toh Aya ");
    this.heightAttribute = 60 * PAGE_SIZE;
    console.log("Par Baad Mein Nahi Aaya", this.heightAttribute);
    this.styleAttribute = "";
    this.styleAttribute =
      "height:" + this.heightAttribute + "px; overflow-y:scroll;";
    console.log("Final Value Aaya", this.styleAttribute);
  }

  handleScroll(event) {
    console.log("Scroll Event Fire Hua", event.target);
    const target = event.target;
    console.log(
      target.scrollHeight - target.scrollTop <= target.clientHeight + 10
    );
    console.log("target.scrollHeight --->", target.scrollHeight);
    console.log("target.scrollTop --->", parseInt(target.scrollTop));
    console.log("target.clientHeight --->", target.clientHeight + 10);
    if (
      target.scrollHeight - parseInt(target.scrollTop) <=
      target.clientHeight + 10
    ) {
      console.log("Scroll If Condition Mein  Aaya");
      this.loadMoreData();
    }
  }

  loadMoreData() {
    console.log("Load More mein aaya");
    if (this.isLoading) {
      console.log("If Condition mein Aaya");
      return; // Prevent multiple simultaneous calls
    }
    console.log("If Mein Nahi Gaya");

    this.isLoading = true;
    this.currentPage++;
    console.log(
      "Page Ek Se  Badha",
      this.currentPage,
      "Loading Change-->",
      this.isLoading
    );

    getContactRecords({ pageSize: PAGE_SIZE, page: this.currentPage })
      .then((data) => {
        console.log("Data Contacts Records se Aaya", data);
        if (data && data.contacts.length > 0) {
          this.visibleData = [...this.visibleData, ...data.contacts];
        }
        console.log("Data is Getting Fetched");
      })
      .catch((error) => {
        console.error("Error fetching more contact records:", error);
      })
      .finally(() => {
        this.isLoading = false;
      });
  }
}
