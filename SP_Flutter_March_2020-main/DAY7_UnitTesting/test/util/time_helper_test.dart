// TODO 1: Write a main() method to execute your tests
// TODO 2: Create a group with the name of the class

// TODO 3.1: Write a test that the TimeHelper should return Morning
// TODO 3.2: Write a test that the TimeHelper should return Afternoon
// TODO 3.3: Write a test that the TimeHelper should return Evening
// TODO 3.4: Write a test that the TimeHelper should return Night

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_testing_tutorial/util/time_helper.dart';

main() {
  // test("Test true to be true", () {
  //   // Arrange
  //   bool expectedBoolValue = true;
  //   // Act

  //   //Assert
  //   expect(expectedBoolValue, false);
  // });

  // test("TimeHelper should return Morning", () {
  //   expect(TimeHelper.getTimeOfTheDay(), "Morning");
  // });

  group("Testing different times returned by TimeHelper", () {
    test("TimeHelper should return Night", () {
      // Arrange
      DateTime currentTime = DateTime(2021, 3, 24, 5);
      // Act
      String returnedValue = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(returnedValue, "Night");
    });

    test("TimeHelper should return Morning", () {
      // Arrange
      DateTime currentTime = DateTime(2021, 3, 24, 9);
      // Act
      String returnedValue = TimeHelper.getTimeOfTheDay(currentTime);
      // Assert
      expect(returnedValue, "Morning");
    });
  }); // eof group
}
