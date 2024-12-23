# SDK Recommendations
- **Flutter**: 3.24.3
- **JDK**: 17.0.12

#### Command for Build Runner:
```bash
dart pub run build_runner watch --delete-conflicting-outputs
```

### Steps:
1. Use the **Hyper UI** extension:
   [Hyper UI Extension for Flutter](https://marketplace.visualstudio.com/items?itemName=denyocr.flutter-hyper-extension)
2. If there is a `state_util.dart` file, open it and comment out its contents.
3. Open `main.dart`. If the code related to `navigatorKey` causes an error, fix the imports to resolve the issue.

#### Note:
The application is still under development. </>