class CutomMap {
  List<String> industries = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    // Add more industries as needed
  ];

  Map<String, List<Map<String, dynamic>>> department = {
    "Technology": [
      {'id': 1, 'name': 'Data Analyst'},
      {'id': 2, 'name': 'Data Scientist'},
      {'id': 3, 'name': 'Big Data Engineer'},
      {'id': 4, 'name': 'Software Developer'},
      {'id': 5, 'name': 'KPO Specialist'}
    ],
    "Healthcare": [
      {'id': 6, 'name': 'Nurse'},
      {'id': 7, 'name': 'Medical Assistant'},
      {'id': 8, 'name': 'Healthcare Administrator'},
      {'id': 9, 'name': 'Clinical Research Coordinator'},
      {'id': 10, 'name': 'Medical Technician'}
    ],
    "Finance": [
      {'id': 11, 'name': 'IT Consultant'},
      {'id': 12, 'name': 'Systems Analyst'},
      {'id': 13, 'name': 'IT Project Manager'},
      {'id': 14, 'name': 'IT Support Specialist'},
      {'id': 15, 'name': 'Network Administrator'}
    ],
    "Education": [
      {'id': 16, 'name': 'Production Manager'},
      {'id': 17, 'name': 'Manufacturing Engineer'},
      {'id': 18, 'name': 'Quality Assurance Specialist'},
      {'id': 19, 'name': 'Process Engineer'},
      {'id': 20, 'name': 'Operations Manager'}
    ],
  };

  Map<String, List<Map<String, dynamic>>> category = {
    "Data Analyst": [
      {'id': 1, 'name': 'Backend'},
      {'id': 2, 'name': 'Frontend'},
      {'id': 3, 'name': 'Data Science'},
      {'id': 4, 'name': 'Business Intelligence'},
      {'id': 5, 'name': 'Software Development'}
    ],
    "Data Scientist": [
      {'id': 6, 'name': 'Clinical'},
      {'id': 7, 'name': 'Administrative'},
      {'id': 8, 'name': 'Medical Support'},
      {'id': 9, 'name': 'Therapeutic'},
      {'id': 10, 'name': 'Healthcare Management'}
    ],
    "Big Data Engineer": [
      {'id': 11, 'name': 'Financial Analysis'},
      {'id': 12, 'name': 'Investment Banking'},
      {'id': 13, 'name': 'Risk Management'},
      {'id': 14, 'name': 'Accounting'},
      {'id': 15, 'name': 'Financial Planning'}
    ],
    "Software Developer": [
      {'id': 16, 'name': 'Backend'},
      {'id': 17, 'name': 'Frontend'},
      {'id': 18, 'name': 'Educational Administration'},
      {'id': 19, 'name': 'Student Services'},
      {'id': 20, 'name': 'Training & Development'}
    ],
  };
}
