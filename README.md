# argon2_ffi

Simple wrapper around argon2 for usage in https://github.com/authpass/kdbx.dart

## To compile

(Use cmake from android sdk `sdk/cmake/3.10.2.4988404/bin/cmake`)

```
cd ios/Classes
cmake .
cmake --build .
```

### Using docker:

```
docker run -v `pwd`:/build --rm rikorose/gcc-cmake bash -c "cd /build/ios/Classes && cmake . && cmake --build ."
```
