# argon2_ffi

Simple wrapper around argon2 for usage in https://github.com/authpass/kdbx.dart

## To compile

```
cd ios/Classes
cmake --build .
```

### Using docker:

```
docker run -v `pwd`:/build --rm rikorose/gcc-cmake bash -c "cd /build/ios/Classes && cmake . && cmake --build ."
```
