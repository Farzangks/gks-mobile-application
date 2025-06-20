import 'package:ghar_ka_sathi/model/rent_property_model.dart';
import 'package:ghar_ka_sathi/model/property_by_categories_model.dart';

class StaticPropertyData {
  static List<PropertyRentResource> getStaticProperties() {
    final now = DateTime.now();

    return [
      PropertyRentResource(
        id: 'static_1',
        name: 'Luxury 3BHK Apartment',
        detail: '3 BHK • 1500 sq ft • Furnished • Modern Amenities',
        price: 4500000,
        category: 'Residential',
        location: 'MP Nagar, Bhopal, Madhya Pradesh',
        type: 'Buy',
        ownerMobile: '+91 9876543210',
        images: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1571936767455-74ea19d84de4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1565623833408-d77e39b88af6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_1',
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now.subtract(const Duration(days: 5)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_2',
        name: 'Modern 2BHK Villa',
        detail: '2 BHK • 1200 sq ft • Semi-Furnished • Garden View',
        price: 3200000,
        category: 'Villa',
        location: 'New Bhopal, Madhya Pradesh',
        type: 'Buy',
        ownerMobile: '+91 9876543211',
        images: [
          'https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
          'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_2',
        createdAt: now.subtract(const Duration(days: 25)),
        updatedAt: now.subtract(const Duration(days: 3)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_3',
        name: 'Spacious 4BHK Duplex',
        detail: '4 BHK • 2500 sq ft • Fully Furnished • Premium Location',
        price: 6800000,
        category: 'Duplex',
        location: 'Arera Colony, Bhopal, Madhya Pradesh',
        type: 'Buy',
        ownerMobile: '+91 9876543212',
        images: [
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2075&q=80',
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2053&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_3',
        createdAt: now.subtract(const Duration(days: 20)),
        updatedAt: now.subtract(const Duration(days: 2)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_4',
        name: 'Cozy 1BHK Flat',
        detail: '1 BHK • 800 sq ft • Unfurnished • Ready to Move',
        price: 2500000,
        category: 'Apartment',
        location: 'Kolar Road, Bhopal, Madhya Pradesh',
        type: 'Sell',
        ownerMobile: '+91 9876543213',
        images: [
          'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2014&q=80',
          'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_4',
        createdAt: now.subtract(const Duration(days: 15)),
        updatedAt: now.subtract(const Duration(days: 1)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_5',
        name: 'Premium 3BHK Penthouse',
        detail: '3 BHK • 2000 sq ft • Fully Furnished • Top Floor',
        price: 8500000,
        category: 'Penthouse',
        location: 'MP Nagar Zone 1, Bhopal, Madhya Pradesh',
        type: 'Sell',
        ownerMobile: '+91 9876543214',
        images: [
          'https://images.unsplash.com/photo-1600607687644-aac4c3eac7f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600573472591-ee6b68d14c68?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600566753086-00f18fb6b3ea?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_5',
        createdAt: now.subtract(const Duration(days: 10)),
        updatedAt: now.subtract(const Duration(hours: 12)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_6',
        name: 'Beautiful 2BHK Apartment',
        detail: '2 BHK • 1100 sq ft • Semi-Furnished • Balcony',
        price: 18000,
        category: 'Apartment',
        location: 'Shahpura, Bhopal, Madhya Pradesh',
        type: 'Rent',
        ownerMobile: '+91 9876543215',
        images: [
          'https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600607688960-e095e31e8c9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600607688969-a5bfcd646154?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_6',
        createdAt: now.subtract(const Duration(days: 8)),
        updatedAt: now.subtract(const Duration(hours: 6)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_7',
        name: 'Executive 3BHK Flat',
        detail: '3 BHK • 1800 sq ft • Furnished • Parking Available',
        price: 22000,
        category: 'Apartment',
        location: 'Indrapuri, Bhopal, Madhya Pradesh',
        type: 'Rent',
        ownerMobile: '+91 9876543216',
        images: [
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2053&q=80',
          'https://images.unsplash.com/photo-1600607688969-a5bfcd646154?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1600607688960-e095e31e8c9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_7',
        createdAt: now.subtract(const Duration(days: 5)),
        updatedAt: now.subtract(const Duration(hours: 3)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_8',
        name: 'Luxury Studio Apartment',
        detail: 'Studio • 600 sq ft • Fully Furnished • Modern Design',
        price: 75000,
        category: 'Studio',
        location: 'Berasia Road, Bhopal, Madhya Pradesh',
        type: 'Lease',
        ownerMobile: '+91 9876543217',
        images: [
          'https://images.unsplash.com/photo-1571936767455-74ea19d84de4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1565623833408-d77e39b88af6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_8',
        createdAt: now.subtract(const Duration(days: 3)),
        updatedAt: now.subtract(const Duration(hours: 2)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
      PropertyRentResource(
        id: 'static_9',
        name: 'Grand 4BHK Bungalow',
        detail: '4 BHK • 3000 sq ft • Furnished • Private Garden',
        price: 120000,
        category: 'Bungalow',
        location: 'Bawadiya Kalan, Bhopal, Madhya Pradesh',
        type: 'Lease',
        ownerMobile: '+91 9876543218',
        images: [
          'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2075&q=80',
          'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2053&q=80',
          'https://images.unsplash.com/photo-1600607687644-aac4c3eac7f4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        deleteUrls: [],
        createdBy: 'static_user_9',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(hours: 1)),
        v: 0,
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
      ),
    ];
  }

  // Create a static PropertyRentModel wrapper with pagination
  static PropertyRentModel getStaticPropertyRentModel() {
    final properties = getStaticProperties();

    return PropertyRentModel(
      page: 1,
      limit: 10,
      totalProperties: properties.length,
      totalPages: 1,
      data: properties,
    );
  }

  // Create static PropertyByCategoriesModel list
  static List<PropertyByCategoriesModel> getStaticPropertyByCategoriesModel() {
    final now = DateTime.now();

    return [
      PropertyByCategoriesModel(
        id: 'static_category_1',
        name: 'Luxury 3BHK Apartment',
        detail: '3 BHK • 1500 sq ft • Furnished • Modern Amenities',
        price: 4500000,
        category: 'Residential',
        location: 'MP Nagar, Bhopal, Madhya Pradesh',
        type: 'Buy',
        ownerMobile: '+91 9876543210',
        images: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1571936767455-74ea19d84de4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
        ],
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
        deleteUrls: [],
        createdBy: 'static_user_1',
        createdAt: now.subtract(const Duration(days: 30)),
        updatedAt: now.subtract(const Duration(days: 5)),
        v: 0,
      ),
      PropertyByCategoriesModel(
        id: 'static_category_2',
        name: 'Modern 2BHK Villa',
        detail: '2 BHK • 1200 sq ft • Semi-Furnished • Garden View',
        price: 3200000,
        category: 'Villa',
        location: 'New Bhopal, Madhya Pradesh',
        type: 'Buy',
        ownerMobile: '+91 9876543211',
        images: [
          'https://images.unsplash.com/photo-1605276374104-dee2a0ed3cd6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
          'https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2071&q=80',
        ],
        video: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        map: '<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3665.6004666342744!2d77.38792831533658!3d23.254568484851676!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x397c4294c28a4c43%3A0x6e7b22a9c3c0b4b5!2sBhopal%2C%20Madhya%20Pradesh!5e0!3m2!1sen!2sin!4v1625646234567!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>',
        deleteUrls: [],
        createdBy: 'static_user_2',
        createdAt: now.subtract(const Duration(days: 25)),
        updatedAt: now.subtract(const Duration(days: 3)),
        v: 0,
      ),
    ];
  }

  // Filter static properties by category
  static List<PropertyByCategoriesModel> filterStaticPropertiesByCategory(String category) {
    final allProperties = getStaticPropertyByCategoriesModel();
    return allProperties.where((property) =>
        property.category.toLowerCase().contains(category.toLowerCase())
    ).toList();
  }

  // Filter static properties by type
  static List<PropertyRentResource> filterStaticPropertiesByType(String type) {
    final allProperties = getStaticProperties();
    return allProperties.where((property) =>
    property.type.toLowerCase() == type.toLowerCase()
    ).toList();
  }
}