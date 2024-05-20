// It contains all our demo data that we used
final List<String> demoRestaurantNames = [
  "Sultan's Dine",
  "kacci vai",
  "Nanna's Biriyani",
  "Hazi's Biriyani",
  "Boba's Biriyani",
  "Beauty's Lassi"
  // Add more restaurant names here as needed
];

final Map<String, String> restaurantImages = {
  "ไก่ทอด หาดหย่าย สูตรเด็ด เจ้าดัง": "assets/images/ไก่ทอดซอสหัวหอม.png",
  "บ้านไก่เกาหลี อร่อยกว่าบอนชอน": "assets/images/ลาบไก่ทอด.jpg",
  "ไก่ทอด ลุงพล ป้าแต๋น": "assets/images/ปีกไก่ทอด.jpg",
  "ไก่ทอดร้านนี้ กินแล้วรวย สวยหล่อ": "assets/images/ข้าวเหนียวไก่ทอด.png",
  "ควยหีแตด": "assets/images/ไก่ทอดหน้าโรงเรียน.jpg"
  // Add more restaurant names and images here as needed
};

List<String> demoBigImages = [
  "assets/images/ไก่ทอดซอสหัวหอม.png",
  "assets/images/ลาบไก่ทอด.jpg",
  "assets/images/ปีกไก่ทอด.jpg",
  "assets/images/ข้าวเหนียวไก่ทอด.png",
  "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
  "assets/images/ไก่ทอดสับ.jpg",
  "assets/images/ข้าวเหนียวไก่ทอด.png",
  "assets/images/ไก่ทอดคาราอาเกะ.jpg",
  "assets/images/ไก่ทอดบ้านๆ.jpg"
];

List<Map<String, dynamic>> demoMediumCardData = [
  {
    "name": "Sultan's Dine",
    "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
    "location": "Baily Road, Dhaka",
    "rating": 8.6,
    "delivertTime": 20,
  },
  {
    "name": "Kacchi Vai",
    "image": "assets/images/ไก่ทอดหาดใหญ่.png",
    "location": "kakrail, Dhaka",
    "rating": 9.1,
    "delivertTime": 35,
  },
  {
    "name": "Nanna Biriyani",
    "image": "assets/images/ไก่ทอดซอสน้ำปลา.png",
    "location": "Puran, Dhaka",
    "rating": 7.3,
    "delivertTime": 25,
  },
  {
    "name": "Hazi Biriyani",
    "image": "assets/images/ข้าวหมกไก่ทอด.png",
    "location": "Puran, Dhaka",
    "rating": 8.4,
    "delivertTime": 30,
  },
  {
    "name": "Boba Biriyani",
    "image": "assets/images/ปีกไก่ทอด.png",
    "location": "Mohammadpur, Dhaka",
    "rating": 9.5,
    "delivertTime": 15,
  }
];

final Map<String, List<Map<String, dynamic>>> restaurantMenu = {
  "Main Menu": [
    {
      "name": "Beef Curry",
      "location": "kakrail, Dhaka",
      "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
      "foodType": "Beef",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    {
      "name": "Beef Curry",
      "location": "kakrail, Dhaka",
      "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
      "foodType": "Beef",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    {
      "name": "Beef Curry",
      "location": "kakrail, Dhaka",
      "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
      "foodType": "Beef",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    {
      "name": "Beef Curry",
      "location": "kakrail, Dhaka",
      "image": "assets/images/ไก่ทอดคลุกซอสเกาหลี.png",
      "foodType": "Beef",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    {
      "name": "Chicken",
      "location": "kakrail, Dhaka",
      "image": "assets/images/ข้าวหมกไก่ทอด.png",
      "foodType": "Chicken",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    // เมนูอาหารอื่นๆ ของร้าน "บ้านไก่เกาหลี อร่อยกว่าบอนชอน" ไปต่อที่นี่
  ],
  "Other Menus": [
    {
      "name": "Great Food",
      "location": "Kakrail, Dhaka",
      "image": "assets/images/ไก่ทอดหาดใหญ่.png",
      "foodType": "food",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    {
      "name": "Great Food",
      "location": "Kakrail, Dhaka",
      "image": "assets/images/ข้าวหมกไก่ทอด.png",
      "foodType": "food",
      "price": 0,
      "priceRange": "Tk.15 - Tk.60",
    },
    // เมนูอาหารอื่นๆ ของร้าน "ไก่ทอด หาดหย่าย สูตรเด็ด เจ้าดัง" ไปต่อที่นี่
  ],
  // เพิ่มร้านอื่นๆ และเมนูอาหารของแต่ละร้านตามต้องการได้ที่นี่
};
