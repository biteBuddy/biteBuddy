const { modelName } = require('./model/user.model');

resData = [
  {
    name: 'Himalayan Bistro',
    description:
      'Experience authentic Nepali cuisine at Himalayan Bistro. Our menu is filled with delicious traditional dishes, including momos, daal bhat, and more. Our cozy atmosphere is perfect for a romantic dinner or a night out with friends. Come visit us and taste the flavors of Nepal.',
    img: '1.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Gorkha Kitchen',
    description:
      'At Gorkha Kitchen, we bring the flavors of Nepal to your table. Our menu includes all your favorites, from chicken curry to chow mein. We use only the freshest ingredients and traditional cooking techniques to ensure that every dish is packed with flavor. Come join us for a meal and experience the taste of Nepal.',
    img: '2.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Kathmandu House',
    description:
      'Welcome to Kathmandu House, where we serve up the best Nepali food in town. From hearty soups to spicy curries, our menu has something for everyone. Our cozy restaurant is the perfect spot for a romantic dinner or a night out with friends. Come visit us and discover the flavors of Nepal.',
    img: '3..jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Basantapur Bites',
    description:
      'Basantapur Bites is your go-to spot for delicious Nepali street food. Our menu includes all the classics, like chow mein, momos, and sekuwa. We use only the freshest ingredients and authentic cooking techniques to bring the flavors of Nepal to your plate. Come visit us and enjoy the best street food in town.',
    img: '4.jpeg',
    category: 'Fast Food',
  },
  {
    name: 'Everest Cafe',
    description:
      "If you're looking for authentic Nepali food, look no further than Everest Cafe. Our menu features all your favorites, from daal bhat to chicken tikka masala. Our cozy atmosphere and friendly staff make us the perfect spot for a family dinner or a night out with friends. Come visit us and taste the flavors of Nepal.",
    img: '5.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Gurkha Grill',
    description:
      'At Gurkha Grill, we take pride in serving the best Nepali cuisine in town. Our menu features a wide variety of dishes, including tandoori chicken, samosas, and more. We use only the freshest ingredients and traditional cooking techniques to bring the flavors of Nepal to your table. Come join us for a meal and experience the taste of Nepal.',
    img: '4.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Pokhara Palace',
    description:
      'Welcome to Pokhara Palace, where we serve up the best Nepali food in town. From hearty soups to spicy curries, our menu has something for everyone. Our cozy restaurant is the perfect spot for a romantic dinner or a night out with friends. Come visit us and discover the flavors of Nepal.',
    img: '7.jpeg',
    category: 'Cafe',
  },

  {
    name: 'Gurkha Kitchen',
    description:
      'Gurkha Kitchen is a family-owned Nepali restaurant in the heart of the city. With a passion for creating authentic Nepali cuisine, our chefs use only the freshest ingredients to prepare our dishes. We offer a wide range of dishes to suit all tastes, from mild to spicy. Come and experience the true taste of Nepal!',
    img: '8.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Himalayan Cafe',
    description:
      'At Himalayan Cafe, we offer the best of both worlds – authentic Nepali cuisine and cozy cafe ambiance. Our chefs use traditional recipes and techniques to create dishes that are bursting with flavor. From momos to thukpa, we have something to satisfy every craving. Come and enjoy a taste of the Himalayas!',
    img: '9.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Mount Everest Buffet',
    description:
      "Our all-you-can-eat buffet is a feast for the senses! Featuring a wide variety of Nepali and Indian dishes, our buffet is sure to please even the pickiest eaters. From tandoori chicken to vegetable curry, there's something for everyone. Come and experience the flavors of the Himalayas at Mount Everest Buffet!",
    img: '10.jpeg',
    category: 'Buffet',
  },
  {
    name: "Yeti's Kitchen",
    description:
      "Yeti's Kitchen is named after the legendary creature said to roam the Himalayan mountains. Our chefs use traditional Nepali cooking techniques and spices to create dishes that are as bold and flavorful as the Yeti itself. From momos to dal bhat, we offer a wide variety of dishes to satisfy any appetite.",
    img: '11.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Kathmandu Cafe',
    description:
      'At Kathmandu Cafe, we bring the flavors of Nepal to your table. Our chefs use only the freshest ingredients to create dishes that are bursting with flavor. From our famous lamb curry to our delicious samosas, we have something for everyone. Come and experience the true taste of Nepal at Kathmandu Cafe!',
    img: '12.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Himalayan Spice',
    description:
      'Spice up your life with the flavors of the Himalayas! At Himalayan Spice, we use traditional Nepali spices to create dishes that are as bold as they are delicious. From our spicy chicken curry to our flavorful vegetable momos, we have something for everyone. Come and enjoy the taste of the Himalayas!',
    img: '13.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Sherpa Buffet',
    description:
      'Our all-you-can-eat buffet is the perfect way to experience the flavors of Nepal. From our delicious goat curry to our flavorful vegetable pakoras, we have something for everyone. Our chefs use traditional Nepali cooking techniques and spices to create dishes that are bursting with flavor. Come and enjoy the taste of the Himalayas!',
    img: '14.jpeg',
    category: 'Buffet',
  },
  {
    name: 'Himalayan Spice',
    description:
      "Himalayan Spice brings the flavors of the mountains to your plate. Our menu features traditional Nepalese and Tibetan dishes, infused with a unique blend of herbs and spices that will leave your taste buds tingling with delight. Whether you're in the mood for a hearty bowl of thukpa or a spicy plate of momos, we've got you covered. Come and experience the taste of the Himalayas at Himalayan Spice!",
    img: '15.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Kathmandu Kitchen',
    description:
      'At Kathmandu Kitchen, we serve up the most authentic Nepali and Indian cuisine this side of the Himalayas. Our menu features a wide range of flavorful dishes, from hearty curries to spicy tandoori specialties. Our chefs use only the freshest ingredients and traditional cooking techniques to ensure that every dish is bursting with flavor. Come and experience the taste of Kathmandu at Kathmandu Kitchen!',
    img: '16.jpeg',
    category: 'Fine Dining',
  },

  {
    name: 'Everest Cafe',
    description:
      'Looking for a cozy spot to relax with friends and family? Look no further than Everest Cafe! Our welcoming atmosphere and delicious menu of Nepalese and Indian specialties will make you feel right at home. Try our famous chai tea, or indulge in a plate of our mouth-watering samosas. We also offer a range of vegetarian and vegan options to suit all dietary needs. Come and experience the warmth of the Himalayas at Everest Cafe!',
    img: '17.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Everest Cafe',
    description:
      'Looking for a cozy spot to relax with friends and family? Look no further than Everest Cafe! Our welcoming atmosphere and delicious menu of Nepalese and Indian specialties will make you feel right at home. Try our famous chai tea, or indulge in a plate of our mouth-watering samosas. We also offer a range of vegetarian and vegan options to suit all dietary needs. Come and experience the warmth of the Himalayas at Everest Cafe!',
    img: '18.jpeg',
    category: 'Cafe',
  },
  {
    name: 'Annapurna Grill',
    description:
      "Annapurna Grill is the place to be for anyone craving authentic Nepali and Indian cuisine. Our menu features a range of flavorful dishes, from spicy vindaloos to creamy kormas. We also offer a wide selection of vegetarian and vegan options, so everyone can enjoy our delicious food. Whether you're looking for a quick lunch or a relaxing dinner with friends and family, Annapurna Grill has got you covered!",
    img: '19.jpeg',
    category: 'Fine Dining',
  },
  {
    name: 'Gurkha Kitchen',
    description:
      "Step into Gurkha Kitchen and transport yourself to the Himalayas. Our menu features a range of traditional Nepali and Indian dishes, each bursting with the bold flavors of the region. From our tender tandoori chicken to our spicy vindaloo, every dish is crafted with care and attention to detail. And with our welcoming atmosphere and friendly staff, you'll feel right at home at Gurkha Kitchen.",
    img: '10.jpeg',
    category: 'Fine Dining',
  },
  {
    name: "Yeti's Delight",
    description:
      "Get ready to indulge in the taste of Nepal at Yeti's Delight. Our menu features a range of delicious Nepali dishes, from spicy thukpa to savory momos. And with our cozy atmosphere and friendly staff, you'll feel right at home as you savor each bite. We also offer a range of vegetarian and vegan options, so everyone can enjoy the taste of Nepal at Yeti's Delight.",
    img: '20.jpeg',
    category: 'Fine Dining',
  },
];

foodData = [
  {
    name: 'Momocha Pizza',
    description: 'Pizza with Nepali momo toppings',
    img: 'pizza.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 500,
      calories: 1200,
      protein: 50,
      carbs: 100,
      fat: 60,
      price: 1500,
    },
  },
  {
    name: 'Butter Chicken Momo',
    description: 'Momo stuffed with butter chicken filling',
    img: 'momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 300,
      calories: 600,
      protein: 30,
      carbs: 40,
      fat: 20,
      price: 500,
    },
  },
  {
    name: 'Nepali Tacos',
    description: 'Tacos with Nepali-style spiced meat and veggies',
    img: 'tacos.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 400,
      calories: 800,
      protein: 35,
      carbs: 60,
      fat: 30,
      price: 800,
    },
  },
  {
    name: 'Momo Burger',
    description: 'Burger with momo patties and spicy mayo',
    img: 'burger.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 450,
      calories: 1000,
      protein: 40,
      carbs: 70,
      fat: 50,
      price: 1200,
    },
  },
  {
    name: 'Dal Bhat Risotto',
    description: 'Creamy Nepali-style risotto made with dal and bhat',
    img: 'dal_bhat.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 350,
      calories: 900,
      protein: 25,
      carbs: 70,
      fat: 40,
      price: 1000,
    },
  },
  {
    name: 'Spicy Fried Chicken Momo',
    description: 'Fried momos with spicy chicken filling',
    img: 'momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 400,
      calories: 800,
      protein: 30,
      carbs: 50,
      fat: 40,
      price: 600,
    },
  },
  {
    name: 'Momo Sliders',
    description:
      'A modern twist on traditional Nepali momo, these sliders are perfect for any party or gathering. Served with a tangy dipping sauce.',
    img: 'momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 200,
      calories: 420,
      protein: 24,
      carbs: 42,
      fat: 16,
      price: 10.99,
    },
  },
  {
    name: 'Spicy Chicken Momo Pizza',
    description:
      'A fusion of Italian and Nepali cuisine, this pizza is topped with spicy chicken momos, bell peppers, and onions.',
    img: 'momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 450,
      calories: 1260,
      protein: 72,
      carbs: 135,
      fat: 45,
      price: 15.99,
    },
  },
  {
    name: 'Teriyaki Chicken Chowmein',
    description:
      'A delicious stir-fried dish that combines the flavors of Japanese and Nepali cuisine. Thin noodles are cooked with teriyaki chicken, broccoli, and carrots.',
    img: 'chowmein.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 350,
      calories: 860,
      protein: 45,
      carbs: 95,
      fat: 30,
      price: 12.99,
    },
  },
  {
    name: 'Tandoori Chicken Naan Wrap',
    description:
      'A twist on the classic chicken tikka masala, this wrap features tandoori chicken stuffed inside a soft naan bread with lettuce, tomatoes, and a yogurt sauce.',
    img: 'nanroti.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 300,
      calories: 890,
      protein: 40,
      carbs: 95,
      fat: 35,
      price: 9.99,
    },
  },
  {
    name: 'Paneer Tikka Quesadilla',
    description:
      'This is a vegetarian version of the popular Mexican dish, the quesadilla. It features spicy paneer tikka, mixed cheese, and peppers, all melted inside a flour tortilla.',
    img: 'paneer_tika.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 350,
      calories: 890,
      protein: 35,
      carbs: 85,
      fat: 30,
      price: 10.99,
    },
  },
  {
    name: 'Nepali Style Tacos',
    description:
      'This is a fun fusion of Nepali and Mexican cuisine. The tacos are filled with spiced ground chicken, lettuce, onions, and topped with a tomato-cilantro salsa.',
    img: 'tacos.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 200,
      calories: 500,
      protein: 20,
      carbs: 45,
      fat: 25,
      price: 7.99,
    },
  },
  {
    name: 'Gochujang Chicken Tacos',
    description:
      'Taco shells filled with spicy gochujang chicken, kimchi, pickled vegetables, and a cilantro-lime crema.',
    img: 'tacos.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 300,
      calories: 600,
      protein: 30,
      carbs: 60,
      fat: 20,
      price: 12.99,
    },
  },

  {
    name: 'Mango and Shrimp Ceviche',
    description:
      'Fresh shrimp and diced mango marinated in lime juice and cilantro, served with tortilla chips.',
    img: 'shrimp.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 250,
      calories: 300,
      protein: 20,
      carbs: 25,
      fat: 15,
      price: 8.99,
    },
  },
  {
    name: 'Chicken Tikka Masala Pizza',
    description:
      'Thin crust pizza topped with chicken tikka masala, mozzarella cheese, and fresh cilantro.',
    img: 'pizza.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 400,
      calories: 700,
      protein: 35,
      carbs: 55,
      fat: 30,
      price: 14.99,
    },
  },
  {
    name: 'Sweet and Sour Pork Belly',
    description:
      'Crispy pork belly pieces coated in a sweet and sour sauce, served over a bed of rice.',
    img: 'pork.webp',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 300,
      calories: 550,
      protein: 28,
      carbs: 40,
      fat: 25,
      price: 13.99,
    },
  },
  {
    name: 'Vegetable Biryani',
    description:
      'A traditional Indian and Nepali dish of rice with mixed vegetables and aromatic spices.',
    img: 'veg_biryani.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 200,
      calories: 350,
      protein: 10,
      carbs: 60,
      fat: 5,
      price: 10,
    },
  },
  {
    name: 'Momo Cha',
    description:
      'A classic Nepali dish of steamed dumplings filled with seasoned ground chicken and served with a spicy tomato-based dipping sauce.',
    img: 'momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 150,
      calories: 250,
      protein: 8,
      carbs: 30,
      fat: 12,
      price: 6,
    },
  },
  {
    name: 'Butter Chicken',
    description:
      'A creamy and rich Indian dish of chicken in a tomato-based sauce with butter and spices, served with naan bread.',
    img: 'butter_chicken2.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 300,
      calories: 550,
      protein: 30,
      carbs: 35,
      fat: 25,
      price: 15,
    },
  },
  {
    name: 'Chatamari Pizza',
    description:
      'A modern Nepali twist on pizza with a rice flour crust, spicy tomato sauce, cheese, and your choice of toppings.',
    img: 'pizza.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 400,
      calories: 800,
      protein: 20,
      carbs: 100,
      fat: 35,
      price: 18,
    },
  },
  {
    name: 'Chow Mein',
    description:
      'A Chinese-inspired stir-fried noodle dish with vegetables, chicken, and flavorful spices.',
    img: 'chowmein.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 250,
      calories: 400,
      protein: 12,
      carbs: 50,
      fat: 15,
      price: 8,
    },
  },
  {
    name: 'Kathmandu Jhol Momo',
    description:
      'A modern twist to traditional momo, this dish is a perfect combination of flavors and texture. The momos are served in a spicy tomato-based broth and topped with crispy noodles and fresh herbs.',
    img: 'jhol_momo.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 350,
      calories: 480,
      protein: 20,
      carbs: 50,
      fat: 18,
      price: 350,
    },
  },
  {
    name: 'Kathmandu Style Chow Mein',
    description:
      'This dish is a Nepali version of the popular Chinese dish chow mein. The noodles are stir-fried with vegetables and meat or tofu, and flavored with a blend of Nepali spices.',
    img: 'chowmein.avif',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 400,
      calories: 560,
      protein: 25,
      carbs: 60,
      fat: 22,
      price: 250,
    },
  },
  {
    name: 'Nepali Style Fried Rice',
    description:
      'This is a Nepali take on the classic Chinese dish fried rice. It is made with rice, vegetables, and meat or tofu, and seasoned with a mix of Nepali spices.',
    img: 'fried_rice.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 450,
      calories: 620,
      protein: 30,
      carbs: 70,
      fat: 25,
      price: 200,
    },
  },
  {
    name: 'Butter Chicken Masala',
    description:
      'This dish is a popular fusion of Nepali and Indian cuisine. It is made with tender chicken pieces in a creamy tomato-based sauce, flavored with a blend of spices, and served with naan or rice.',
    img: 'butter_chicken2.jpeg',
    restaurantId: '6451df32cabe26e95ff9c8a2',
    nutrient: {
      mass_in_g: 500,
      calories: 720,
      protein: 35,
      carbs: 80,
      fat: 28,
      price: 450,
    },
  },
];

module.exports = { resData, foodData };
