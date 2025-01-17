// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `We Will`
  String get welcome1 {
    return Intl.message(
      'We Will',
      name: 'welcome1',
      desc: '',
      args: [],
    );
  }

  /// `Make Your Life Easier`
  String get welcome2 {
    return Intl.message(
      'Make Your Life Easier',
      name: 'welcome2',
      desc: '',
      args: [],
    );
  }

  /// `Let's Get Started`
  String get lets_get_started_button {
    return Intl.message(
      'Let\'s Get Started',
      name: 'lets_get_started_button',
      desc: '',
      args: [],
    );
  }

  /// `WELCOME`
  String get register1 {
    return Intl.message(
      'WELCOME',
      name: 'register1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get register2 {
    return Intl.message(
      'Enter your phone number',
      name: 'register2',
      desc: '',
      args: [],
    );
  }

  /// `we will send you the 4 digit verification code`
  String get register3 {
    return Intl.message(
      'we will send you the 4 digit verification code',
      name: 'register3',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get register_button {
    return Intl.message(
      'REGISTER',
      name: 'register_button',
      desc: '',
      args: [],
    );
  }

  /// `WAIT...`
  String get verification1 {
    return Intl.message(
      'WAIT...',
      name: 'verification1',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verification2 {
    return Intl.message(
      'Verification Code',
      name: 'verification2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter code sent to`
  String get verification3 {
    return Intl.message(
      'Please enter code sent to',
      name: 'verification3',
      desc: '',
      args: [],
    );
  }

  /// `VERIFY`
  String get verification_button {
    return Intl.message(
      'VERIFY',
      name: 'verification_button',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get resend_code_button {
    return Intl.message(
      'Resend code',
      name: 'resend_code_button',
      desc: '',
      args: [],
    );
  }

  /// `HI DEAR!`
  String get setting_info1 {
    return Intl.message(
      'HI DEAR!',
      name: 'setting_info1',
      desc: '',
      args: [],
    );
  }

  /// `Upload photo`
  String get upload_photo_button {
    return Intl.message(
      'Upload photo',
      name: 'upload_photo_button',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name_hint {
    return Intl.message(
      'Full Name',
      name: 'full_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `SUBMIT`
  String get submit_button {
    return Intl.message(
      'SUBMIT',
      name: 'submit_button',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get home1 {
    return Intl.message(
      'Welcome',
      name: 'home1',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search_hint {
    return Intl.message(
      'Search...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Special Offer`
  String get special_offer {
    return Intl.message(
      'Special Offer',
      name: 'special_offer',
      desc: '',
      args: [],
    );
  }

  /// `Up to`
  String get up_to {
    return Intl.message(
      'Up to',
      name: 'up_to',
      desc: '',
      args: [],
    );
  }

  /// `Shop Now`
  String get shop_now_button {
    return Intl.message(
      'Shop Now',
      name: 'shop_now_button',
      desc: '',
      args: [],
    );
  }

  /// `HOT`
  String get hot {
    return Intl.message(
      'HOT',
      name: 'hot',
      desc: '',
      args: [],
    );
  }

  /// `S.P`
  String get sp {
    return Intl.message(
      'S.P',
      name: 'sp',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add_button {
    return Intl.message(
      'Add',
      name: 'add_button',
      desc: '',
      args: [],
    );
  }

  /// `Newest`
  String get order_filter1 {
    return Intl.message(
      'Newest',
      name: 'order_filter1',
      desc: '',
      args: [],
    );
  }

  /// `Oldest`
  String get order_filter2 {
    return Intl.message(
      'Oldest',
      name: 'order_filter2',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get order_filter3 {
    return Intl.message(
      'Delivered',
      name: 'order_filter3',
      desc: '',
      args: [],
    );
  }

  /// `On the way`
  String get order_filter4 {
    return Intl.message(
      'On the way',
      name: 'order_filter4',
      desc: '',
      args: [],
    );
  }

  /// `Preparing`
  String get order_filter5 {
    return Intl.message(
      'Preparing',
      name: 'order_filter5',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get order_filter6 {
    return Intl.message(
      'Pending',
      name: 'order_filter6',
      desc: '',
      args: [],
    );
  }

  /// `Product`
  String get order_details1 {
    return Intl.message(
      'Product',
      name: 'order_details1',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get order_details2 {
    return Intl.message(
      'Quantity',
      name: 'order_details2',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get order_details3 {
    return Intl.message(
      'Price',
      name: 'order_details3',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get setting1 {
    return Intl.message(
      'Appearance',
      name: 'setting1',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get setting1_details1 {
    return Intl.message(
      'System',
      name: 'setting1_details1',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get setting1_details2 {
    return Intl.message(
      'Light',
      name: 'setting1_details2',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get setting1_details3 {
    return Intl.message(
      'Dark',
      name: 'setting1_details3',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get setting2 {
    return Intl.message(
      'Notifications',
      name: 'setting2',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get setting3 {
    return Intl.message(
      'Language',
      name: 'setting3',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get setting4 {
    return Intl.message(
      'About',
      name: 'setting4',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get setting5 {
    return Intl.message(
      'Feedback',
      name: 'setting5',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get product_details1 {
    return Intl.message(
      'Items',
      name: 'product_details1',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get product_details2 {
    return Intl.message(
      'Description',
      name: 'product_details2',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart1 {
    return Intl.message(
      'Cart',
      name: 'cart1',
      desc: '',
      args: [],
    );
  }

  /// `Selected Items`
  String get cart2 {
    return Intl.message(
      'Selected Items',
      name: 'cart2',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Charge`
  String get cart3 {
    return Intl.message(
      'Delivery Charge',
      name: 'cart3',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get cart4 {
    return Intl.message(
      'Subtotal',
      name: 'cart4',
      desc: '',
      args: [],
    );
  }

  /// `Select All`
  String get cart5 {
    return Intl.message(
      'Select All',
      name: 'cart5',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete_button {
    return Intl.message(
      'Delete',
      name: 'delete_button',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `LOGOUT`
  String get logout_button {
    return Intl.message(
      'LOGOUT',
      name: 'logout_button',
      desc: '',
      args: [],
    );
  }

  /// `What are you looking for?`
  String get search_phrase {
    return Intl.message(
      'What are you looking for?',
      name: 'search_phrase',
      desc: '',
      args: [],
    );
  }

  /// `Please wait a little...`
  String get wait_message {
    return Intl.message(
      'Please wait a little...',
      name: 'wait_message',
      desc: '',
      args: [],
    );
  }

  /// `Your location was updates successfully!`
  String get edit_location_message {
    return Intl.message(
      'Your location was updates successfully!',
      name: 'edit_location_message',
      desc: '',
      args: [],
    );
  }

  /// `Your name was changed successfully!`
  String get edit_name_message {
    return Intl.message(
      'Your name was changed successfully!',
      name: 'edit_name_message',
      desc: '',
      args: [],
    );
  }

  /// `Your image was changed successfully!`
  String get edit_image_message {
    return Intl.message(
      'Your image was changed successfully!',
      name: 'edit_image_message',
      desc: '',
      args: [],
    );
  }

  /// `please enter a valid phone number`
  String get phone_number_message {
    return Intl.message(
      'please enter a valid phone number',
      name: 'phone_number_message',
      desc: '',
      args: [],
    );
  }

  /// `field is required`
  String get field_empty_message {
    return Intl.message(
      'field is required',
      name: 'field_empty_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a full name consisting of no more than three words`
  String get full_name_message {
    return Intl.message(
      'Please enter a full name consisting of no more than three words',
      name: 'full_name_message',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid name!`
  String get full_name_message2 {
    return Intl.message(
      'Enter a valid name!',
      name: 'full_name_message2',
      desc: '',
      args: [],
    );
  }

  /// `Verification code was sent to you!`
  String get verification_message {
    return Intl.message(
      'Verification code was sent to you!',
      name: 'verification_message',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get default_user_message {
    return Intl.message(
      'User',
      name: 'default_user_message',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_dialog {
    return Intl.message(
      'Settings',
      name: 'settings_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_dialog {
    return Intl.message(
      'Cancel',
      name: 'cancel_dialog',
      desc: '',
      args: [],
    );
  }

  /// `Permission Denied!`
  String get permission_denied {
    return Intl.message(
      'Permission Denied!',
      name: 'permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `You have to activate notifications`
  String get permission_message {
    return Intl.message(
      'You have to activate notifications',
      name: 'permission_message',
      desc: '',
      args: [],
    );
  }

  /// `Activated`
  String get active {
    return Intl.message(
      'Activated',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  /// `Inactivated`
  String get inactive {
    return Intl.message(
      'Inactivated',
      name: 'inactive',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Stores`
  String get stores {
    return Intl.message(
      'Stores',
      name: 'stores',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get see_all {
    return Intl.message(
      'See all',
      name: 'see_all',
      desc: '',
      args: [],
    );
  }

  /// `All Products`
  String get all_products {
    return Intl.message(
      'All Products',
      name: 'all_products',
      desc: '',
      args: [],
    );
  }

  /// `All Stores`
  String get all_stores {
    return Intl.message(
      'All Stores',
      name: 'all_stores',
      desc: '',
      args: [],
    );
  }

  /// `Go Shopping`
  String get go_shopping {
    return Intl.message(
      'Go Shopping',
      name: 'go_shopping',
      desc: '',
      args: [],
    );
  }

  /// `Your Cart is Empty!`
  String get empty_cart {
    return Intl.message(
      'Your Cart is Empty!',
      name: 'empty_cart',
      desc: '',
      args: [],
    );
  }

  /// `There are no products in your favorites yet!`
  String get empty_favorite {
    return Intl.message(
      'There are no products in your favorites yet!',
      name: 'empty_favorite',
      desc: '',
      args: [],
    );
  }

  /// `The product has been added to the cart successfully!`
  String get add_to_cart_message {
    return Intl.message(
      'The product has been added to the cart successfully!',
      name: 'add_to_cart_message',
      desc: '',
      args: [],
    );
  }

  /// `The product has been deleted from the cart successfully!`
  String get remove_from_cart_message {
    return Intl.message(
      'The product has been deleted from the cart successfully!',
      name: 'remove_from_cart_message',
      desc: '',
      args: [],
    );
  }

  /// `There are no orders yet!`
  String get empty_orders_message {
    return Intl.message(
      'There are no orders yet!',
      name: 'empty_orders_message',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancel_order {
    return Intl.message(
      'Cancel Order',
      name: 'cancel_order',
      desc: '',
      args: [],
    );
  }

  /// `Edit Order`
  String get edit_order {
    return Intl.message(
      'Edit Order',
      name: 'edit_order',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
