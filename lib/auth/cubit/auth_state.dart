import 'package:flutter/material.dart';

abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class WorkAuthState extends AuthState {}

class ErrorAuthState extends AuthState {}
