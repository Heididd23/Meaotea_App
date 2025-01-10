import 'package:flutter/material.dart';

class RewardsFAQsPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "How can I earn points?",
      "answer": "You can earn points by making purchases. Every RM 1 spent earns you 1 point.",
    },
    {
      "question": "How can I redeem rewards?",
      "answer": "You can redeem rewards from the Rewards page by using your earned points.",
    },
    {
      "question": "Do points expire?",
      "answer": "Yes, points expire after 12 months of inactivity in your account.",
    },
    {
      "question": "How do I check my points balance?",
      "answer": "You can check your points balance on the Rewards page under your Meaotea Points.",
    },
  ];

  RewardsFAQsPage({Key? key}) : super(key: key); // Add Key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rewards FAQs',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return FAQItem(
              question: faq["question"]!,
              answer: faq["answer"]!,
            );
          },
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({Key? key, required this.question, required this.answer}) : super(key: key); // Add Key parameter

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: Colors.red,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
      ),
    );
  }
}
