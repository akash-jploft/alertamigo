import 'package:flutter/material.dart';

class PremiumModal extends StatelessWidget {
  const PremiumModal({super.key});

  @override
  Widget build(BuildContext context) {
    buildPrice({required String duration, required String offer, required String price}) {
      return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical:offer == ""? 24: 18,
        ),
        child: Row(
          children: [



            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  duration,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
               if(offer != "") Text(offer),
              ],
            ),
            const Spacer(),
            Text(
              price,
              style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w500,fontSize: 18),
            ),
          ],
        ),
      );
    }

    buildOffer({required String offer}){
      return Row(
        children: [
          const Icon(Icons.check),
          const SizedBox(width: 18,),
          Flexible(child: Text(offer,style: const TextStyle(letterSpacing: 1.1,fontSize: 16),))
        ],
      );
    }
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: .5,
        automaticallyImplyLeading: false,
        actions: const [
          CloseButton(
            color: Colors.black,
          )
        ],
        backgroundColor: Colors.white,
        title: const Text(
          "Upgrade to premium",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 18,),
            buildPrice(duration: "0 Month Trail", price: "Free", offer: ""),
            const SizedBox(height: 10,),
            buildPrice(duration: "Month", price: "\$00.00", offer: ""),
            const SizedBox(height: 10,),
            buildPrice(duration: "6 Months", price: "\$00.00", offer: "\$00.00 per month. Save 20%"),
            const SizedBox(height: 10,),
            buildPrice(duration: "Year", price: "\$00.00", offer: "\$00.00 per month. Save 50%"),
            const SizedBox(height: 38,),
        //    buildOffer(offer: "ID verification required"),
        //    SizedBox(height: 24,),
            buildOffer(offer: "Post, share & comment on incidents"),
            const SizedBox(height: 28,),
            buildOffer(offer: "See incidents in other areas"),
            const SizedBox(height: 28,),
            buildOffer(offer: "Receive notification on incidents around you"),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
