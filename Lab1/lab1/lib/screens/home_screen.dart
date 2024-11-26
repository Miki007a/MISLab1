import 'package:flutter/material.dart';
import '../models/clothing_item.dart';

class HomeScreen extends StatelessWidget {
  final List<ClothingItem> items = [
     ClothingItem(
      id: '1',
      name: 'Зимско палто',
      description: 'Елегантно зимско палто во црна боја, идеално за студени денови. Изработено од висококвалитетна волна.',
      price: 3999.99,
      imageUrl: 'https://plus.unsplash.com/premium_photo-1674718917175-70e7062732e5?q=80&w=1889&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ClothingItem(
      id: '2',
      name: 'Кожна јакна',
      description: 'Класична кожна јакна во кафена боја. Совршена за есенски денови.',
      price: 4599.99,
      imageUrl: 'https://images.unsplash.com/photo-1551028719-00167b16eac5',
    ),
    ClothingItem(
      id: '3',
      name: 'Фармерки',
      description: 'Модерни фармерки со висок струк и slim fit крој.',
      price: 2299.99,
      imageUrl: 'https://images.unsplash.com/photo-1658857635450-f25dacd2589d?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    ClothingItem(
      id: '4',
      name: 'Џемпер',
      description: 'Топол плетен џемпер во бела боја, идеален за зимски денови.',
      price: 1799.99,
      imageUrl: 'https://images.unsplash.com/photo-1556905055-8f358a7a47b2',
    )
  ];

    @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('213203'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: deviceWidth > 600 ? 3 : 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (ctx, i) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: items[i],
            );
          },
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        items[i].imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            width: double.infinity,
                            height: double.infinity,
                            child: Icon(Icons.error),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    items[i].name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    '${items[i].price} ден.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}