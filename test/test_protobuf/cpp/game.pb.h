// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: game.proto

#ifndef PROTOBUF_game_2eproto__INCLUDED
#define PROTOBUF_game_2eproto__INCLUDED

#include <string>

#include <google/protobuf/stubs/common.h>

#if GOOGLE_PROTOBUF_VERSION < 2005000
#error This file was generated by a newer version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please update
#error your headers.
#endif
#if 2005000 < GOOGLE_PROTOBUF_MIN_PROTOC_VERSION
#error This file was generated by an older version of protoc which is
#error incompatible with your Protocol Buffer headers.  Please
#error regenerate this file with a newer version of protoc.
#endif

#include <google/protobuf/generated_message_util.h>
#include <google/protobuf/message.h>
#include <google/protobuf/repeated_field.h>
#include <google/protobuf/extension_set.h>
#include <google/protobuf/generated_enum_reflection.h>
#include <google/protobuf/unknown_field_set.h>
// @@protoc_insertion_point(includes)

// Internal implementation detail -- do not call these.
void  protobuf_AddDesc_game_2eproto();
void protobuf_AssignDesc_game_2eproto();
void protobuf_ShutdownFile_game_2eproto();

class kv;
class person;
class family;
class int_kv;
class user;

enum gender {
  male = 1,
  female = 2
};
bool gender_IsValid(int value);
const gender gender_MIN = male;
const gender gender_MAX = female;
const int gender_ARRAYSIZE = gender_MAX + 1;

const ::google::protobuf::EnumDescriptor* gender_descriptor();
inline const ::std::string& gender_Name(gender value) {
  return ::google::protobuf::internal::NameOfEnum(
    gender_descriptor(), value);
}
inline bool gender_Parse(
    const ::std::string& name, gender* value) {
  return ::google::protobuf::internal::ParseNamedEnum<gender>(
    gender_descriptor(), name, value);
}
enum point_type {
  skill_point = 1,
  arena_point = 2,
  guild_point = 3
};
bool point_type_IsValid(int value);
const point_type point_type_MIN = skill_point;
const point_type point_type_MAX = guild_point;
const int point_type_ARRAYSIZE = point_type_MAX + 1;

const ::google::protobuf::EnumDescriptor* point_type_descriptor();
inline const ::std::string& point_type_Name(point_type value) {
  return ::google::protobuf::internal::NameOfEnum(
    point_type_descriptor(), value);
}
inline bool point_type_Parse(
    const ::std::string& name, point_type* value) {
  return ::google::protobuf::internal::ParseNamedEnum<point_type>(
    point_type_descriptor(), name, value);
}
// ===================================================================

class kv : public ::google::protobuf::Message {
 public:
  kv();
  virtual ~kv();

  kv(const kv& from);

  inline kv& operator=(const kv& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const kv& default_instance();

  void Swap(kv* other);

  // implements Message ----------------------------------------------

  kv* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const kv& from);
  void MergeFrom(const kv& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // optional .point_type key = 1;
  inline bool has_key() const;
  inline void clear_key();
  static const int kKeyFieldNumber = 1;
  inline ::point_type key() const;
  inline void set_key(::point_type value);

  // optional int32 value = 2;
  inline bool has_value() const;
  inline void clear_value();
  static const int kValueFieldNumber = 2;
  inline ::google::protobuf::int32 value() const;
  inline void set_value(::google::protobuf::int32 value);

  // @@protoc_insertion_point(class_scope:kv)
 private:
  inline void set_has_key();
  inline void clear_has_key();
  inline void set_has_value();
  inline void clear_has_value();

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  int key_;
  ::google::protobuf::int32 value_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(2 + 31) / 32];

  friend void  protobuf_AddDesc_game_2eproto();
  friend void protobuf_AssignDesc_game_2eproto();
  friend void protobuf_ShutdownFile_game_2eproto();

  void InitAsDefaultInstance();
  static kv* default_instance_;
};
// -------------------------------------------------------------------

class person : public ::google::protobuf::Message {
 public:
  person();
  virtual ~person();

  person(const person& from);

  inline person& operator=(const person& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const person& default_instance();

  void Swap(person* other);

  // implements Message ----------------------------------------------

  person* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const person& from);
  void MergeFrom(const person& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // required int32 age = 1;
  inline bool has_age() const;
  inline void clear_age();
  static const int kAgeFieldNumber = 1;
  inline ::google::protobuf::int32 age() const;
  inline void set_age(::google::protobuf::int32 value);

  // required string name = 2;
  inline bool has_name() const;
  inline void clear_name();
  static const int kNameFieldNumber = 2;
  inline const ::std::string& name() const;
  inline void set_name(const ::std::string& value);
  inline void set_name(const char* value);
  inline void set_name(const char* value, size_t size);
  inline ::std::string* mutable_name();
  inline ::std::string* release_name();
  inline void set_allocated_name(::std::string* name);

  // optional .gender gender = 3;
  inline bool has_gender() const;
  inline void clear_gender();
  static const int kGenderFieldNumber = 3;
  inline ::gender gender() const;
  inline void set_gender(::gender value);

  // optional string desp = 4;
  inline bool has_desp() const;
  inline void clear_desp();
  static const int kDespFieldNumber = 4;
  inline const ::std::string& desp() const;
  inline void set_desp(const ::std::string& value);
  inline void set_desp(const char* value);
  inline void set_desp(const char* value, size_t size);
  inline ::std::string* mutable_desp();
  inline ::std::string* release_desp();
  inline void set_allocated_desp(::std::string* desp);

  // repeated .kv dict = 5;
  inline int dict_size() const;
  inline void clear_dict();
  static const int kDictFieldNumber = 5;
  inline const ::kv& dict(int index) const;
  inline ::kv* mutable_dict(int index);
  inline ::kv* add_dict();
  inline const ::google::protobuf::RepeatedPtrField< ::kv >&
      dict() const;
  inline ::google::protobuf::RepeatedPtrField< ::kv >*
      mutable_dict();

  // @@protoc_insertion_point(class_scope:person)
 private:
  inline void set_has_age();
  inline void clear_has_age();
  inline void set_has_name();
  inline void clear_has_name();
  inline void set_has_gender();
  inline void clear_has_gender();
  inline void set_has_desp();
  inline void clear_has_desp();

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  ::std::string* name_;
  ::google::protobuf::int32 age_;
  int gender_;
  ::std::string* desp_;
  ::google::protobuf::RepeatedPtrField< ::kv > dict_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(5 + 31) / 32];

  friend void  protobuf_AddDesc_game_2eproto();
  friend void protobuf_AssignDesc_game_2eproto();
  friend void protobuf_ShutdownFile_game_2eproto();

  void InitAsDefaultInstance();
  static person* default_instance_;
};
// -------------------------------------------------------------------

class family : public ::google::protobuf::Message {
 public:
  family();
  virtual ~family();

  family(const family& from);

  inline family& operator=(const family& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const family& default_instance();

  void Swap(family* other);

  // implements Message ----------------------------------------------

  family* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const family& from);
  void MergeFrom(const family& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // repeated .person person = 1;
  inline int person_size() const;
  inline void clear_person();
  static const int kPersonFieldNumber = 1;
  inline const ::person& person(int index) const;
  inline ::person* mutable_person(int index);
  inline ::person* add_person();
  inline const ::google::protobuf::RepeatedPtrField< ::person >&
      person() const;
  inline ::google::protobuf::RepeatedPtrField< ::person >*
      mutable_person();

  // @@protoc_insertion_point(class_scope:family)
 private:

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  ::google::protobuf::RepeatedPtrField< ::person > person_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(1 + 31) / 32];

  friend void  protobuf_AddDesc_game_2eproto();
  friend void protobuf_AssignDesc_game_2eproto();
  friend void protobuf_ShutdownFile_game_2eproto();

  void InitAsDefaultInstance();
  static family* default_instance_;
};
// -------------------------------------------------------------------

class int_kv : public ::google::protobuf::Message {
 public:
  int_kv();
  virtual ~int_kv();

  int_kv(const int_kv& from);

  inline int_kv& operator=(const int_kv& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const int_kv& default_instance();

  void Swap(int_kv* other);

  // implements Message ----------------------------------------------

  int_kv* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const int_kv& from);
  void MergeFrom(const int_kv& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // optional int32 key = 1;
  inline bool has_key() const;
  inline void clear_key();
  static const int kKeyFieldNumber = 1;
  inline ::google::protobuf::int32 key() const;
  inline void set_key(::google::protobuf::int32 value);

  // optional int32 value = 2;
  inline bool has_value() const;
  inline void clear_value();
  static const int kValueFieldNumber = 2;
  inline ::google::protobuf::int32 value() const;
  inline void set_value(::google::protobuf::int32 value);

  // @@protoc_insertion_point(class_scope:int_kv)
 private:
  inline void set_has_key();
  inline void clear_has_key();
  inline void set_has_value();
  inline void clear_has_value();

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  ::google::protobuf::int32 key_;
  ::google::protobuf::int32 value_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(2 + 31) / 32];

  friend void  protobuf_AddDesc_game_2eproto();
  friend void protobuf_AssignDesc_game_2eproto();
  friend void protobuf_ShutdownFile_game_2eproto();

  void InitAsDefaultInstance();
  static int_kv* default_instance_;
};
// -------------------------------------------------------------------

class user : public ::google::protobuf::Message {
 public:
  user();
  virtual ~user();

  user(const user& from);

  inline user& operator=(const user& from) {
    CopyFrom(from);
    return *this;
  }

  inline const ::google::protobuf::UnknownFieldSet& unknown_fields() const {
    return _unknown_fields_;
  }

  inline ::google::protobuf::UnknownFieldSet* mutable_unknown_fields() {
    return &_unknown_fields_;
  }

  static const ::google::protobuf::Descriptor* descriptor();
  static const user& default_instance();

  void Swap(user* other);

  // implements Message ----------------------------------------------

  user* New() const;
  void CopyFrom(const ::google::protobuf::Message& from);
  void MergeFrom(const ::google::protobuf::Message& from);
  void CopyFrom(const user& from);
  void MergeFrom(const user& from);
  void Clear();
  bool IsInitialized() const;

  int ByteSize() const;
  bool MergePartialFromCodedStream(
      ::google::protobuf::io::CodedInputStream* input);
  void SerializeWithCachedSizes(
      ::google::protobuf::io::CodedOutputStream* output) const;
  ::google::protobuf::uint8* SerializeWithCachedSizesToArray(::google::protobuf::uint8* output) const;
  int GetCachedSize() const { return _cached_size_; }
  private:
  void SharedCtor();
  void SharedDtor();
  void SetCachedSize(int size) const;
  public:

  ::google::protobuf::Metadata GetMetadata() const;

  // nested types ----------------------------------------------------

  // accessors -------------------------------------------------------

  // optional int32 uid = 1;
  inline bool has_uid() const;
  inline void clear_uid();
  static const int kUidFieldNumber = 1;
  inline ::google::protobuf::int32 uid() const;
  inline void set_uid(::google::protobuf::int32 value);

  // optional string name = 2;
  inline bool has_name() const;
  inline void clear_name();
  static const int kNameFieldNumber = 2;
  inline const ::std::string& name() const;
  inline void set_name(const ::std::string& value);
  inline void set_name(const char* value);
  inline void set_name(const char* value, size_t size);
  inline ::std::string* mutable_name();
  inline ::std::string* release_name();
  inline void set_allocated_name(::std::string* name);

  // optional .gender gener = 3;
  inline bool has_gener() const;
  inline void clear_gener();
  static const int kGenerFieldNumber = 3;
  inline ::gender gener() const;
  inline void set_gener(::gender value);

  // repeated .int_kv bags = 4;
  inline int bags_size() const;
  inline void clear_bags();
  static const int kBagsFieldNumber = 4;
  inline const ::int_kv& bags(int index) const;
  inline ::int_kv* mutable_bags(int index);
  inline ::int_kv* add_bags();
  inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
      bags() const;
  inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
      mutable_bags();

  // repeated .int_kv heroes = 5;
  inline int heroes_size() const;
  inline void clear_heroes();
  static const int kHeroesFieldNumber = 5;
  inline const ::int_kv& heroes(int index) const;
  inline ::int_kv* mutable_heroes(int index);
  inline ::int_kv* add_heroes();
  inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
      heroes() const;
  inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
      mutable_heroes();

  // repeated .int_kv skills = 6;
  inline int skills_size() const;
  inline void clear_skills();
  static const int kSkillsFieldNumber = 6;
  inline const ::int_kv& skills(int index) const;
  inline ::int_kv* mutable_skills(int index);
  inline ::int_kv* add_skills();
  inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
      skills() const;
  inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
      mutable_skills();

  // @@protoc_insertion_point(class_scope:user)
 private:
  inline void set_has_uid();
  inline void clear_has_uid();
  inline void set_has_name();
  inline void clear_has_name();
  inline void set_has_gener();
  inline void clear_has_gener();

  ::google::protobuf::UnknownFieldSet _unknown_fields_;

  ::std::string* name_;
  ::google::protobuf::int32 uid_;
  int gener_;
  ::google::protobuf::RepeatedPtrField< ::int_kv > bags_;
  ::google::protobuf::RepeatedPtrField< ::int_kv > heroes_;
  ::google::protobuf::RepeatedPtrField< ::int_kv > skills_;

  mutable int _cached_size_;
  ::google::protobuf::uint32 _has_bits_[(6 + 31) / 32];

  friend void  protobuf_AddDesc_game_2eproto();
  friend void protobuf_AssignDesc_game_2eproto();
  friend void protobuf_ShutdownFile_game_2eproto();

  void InitAsDefaultInstance();
  static user* default_instance_;
};
// ===================================================================


// ===================================================================

// kv

// optional .point_type key = 1;
inline bool kv::has_key() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void kv::set_has_key() {
  _has_bits_[0] |= 0x00000001u;
}
inline void kv::clear_has_key() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void kv::clear_key() {
  key_ = 1;
  clear_has_key();
}
inline ::point_type kv::key() const {
  return static_cast< ::point_type >(key_);
}
inline void kv::set_key(::point_type value) {
  assert(::point_type_IsValid(value));
  set_has_key();
  key_ = value;
}

// optional int32 value = 2;
inline bool kv::has_value() const {
  return (_has_bits_[0] & 0x00000002u) != 0;
}
inline void kv::set_has_value() {
  _has_bits_[0] |= 0x00000002u;
}
inline void kv::clear_has_value() {
  _has_bits_[0] &= ~0x00000002u;
}
inline void kv::clear_value() {
  value_ = 0;
  clear_has_value();
}
inline ::google::protobuf::int32 kv::value() const {
  return value_;
}
inline void kv::set_value(::google::protobuf::int32 value) {
  set_has_value();
  value_ = value;
}

// -------------------------------------------------------------------

// person

// required int32 age = 1;
inline bool person::has_age() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void person::set_has_age() {
  _has_bits_[0] |= 0x00000001u;
}
inline void person::clear_has_age() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void person::clear_age() {
  age_ = 0;
  clear_has_age();
}
inline ::google::protobuf::int32 person::age() const {
  return age_;
}
inline void person::set_age(::google::protobuf::int32 value) {
  set_has_age();
  age_ = value;
}

// required string name = 2;
inline bool person::has_name() const {
  return (_has_bits_[0] & 0x00000002u) != 0;
}
inline void person::set_has_name() {
  _has_bits_[0] |= 0x00000002u;
}
inline void person::clear_has_name() {
  _has_bits_[0] &= ~0x00000002u;
}
inline void person::clear_name() {
  if (name_ != &::google::protobuf::internal::kEmptyString) {
    name_->clear();
  }
  clear_has_name();
}
inline const ::std::string& person::name() const {
  return *name_;
}
inline void person::set_name(const ::std::string& value) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(value);
}
inline void person::set_name(const char* value) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(value);
}
inline void person::set_name(const char* value, size_t size) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(reinterpret_cast<const char*>(value), size);
}
inline ::std::string* person::mutable_name() {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  return name_;
}
inline ::std::string* person::release_name() {
  clear_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    return NULL;
  } else {
    ::std::string* temp = name_;
    name_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
    return temp;
  }
}
inline void person::set_allocated_name(::std::string* name) {
  if (name_ != &::google::protobuf::internal::kEmptyString) {
    delete name_;
  }
  if (name) {
    set_has_name();
    name_ = name;
  } else {
    clear_has_name();
    name_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
  }
}

// optional .gender gender = 3;
inline bool person::has_gender() const {
  return (_has_bits_[0] & 0x00000004u) != 0;
}
inline void person::set_has_gender() {
  _has_bits_[0] |= 0x00000004u;
}
inline void person::clear_has_gender() {
  _has_bits_[0] &= ~0x00000004u;
}
inline void person::clear_gender() {
  gender_ = 1;
  clear_has_gender();
}
inline ::gender person::gender() const {
  return static_cast< ::gender >(gender_);
}
inline void person::set_gender(::gender value) {
  assert(::gender_IsValid(value));
  set_has_gender();
  gender_ = value;
}

// optional string desp = 4;
inline bool person::has_desp() const {
  return (_has_bits_[0] & 0x00000008u) != 0;
}
inline void person::set_has_desp() {
  _has_bits_[0] |= 0x00000008u;
}
inline void person::clear_has_desp() {
  _has_bits_[0] &= ~0x00000008u;
}
inline void person::clear_desp() {
  if (desp_ != &::google::protobuf::internal::kEmptyString) {
    desp_->clear();
  }
  clear_has_desp();
}
inline const ::std::string& person::desp() const {
  return *desp_;
}
inline void person::set_desp(const ::std::string& value) {
  set_has_desp();
  if (desp_ == &::google::protobuf::internal::kEmptyString) {
    desp_ = new ::std::string;
  }
  desp_->assign(value);
}
inline void person::set_desp(const char* value) {
  set_has_desp();
  if (desp_ == &::google::protobuf::internal::kEmptyString) {
    desp_ = new ::std::string;
  }
  desp_->assign(value);
}
inline void person::set_desp(const char* value, size_t size) {
  set_has_desp();
  if (desp_ == &::google::protobuf::internal::kEmptyString) {
    desp_ = new ::std::string;
  }
  desp_->assign(reinterpret_cast<const char*>(value), size);
}
inline ::std::string* person::mutable_desp() {
  set_has_desp();
  if (desp_ == &::google::protobuf::internal::kEmptyString) {
    desp_ = new ::std::string;
  }
  return desp_;
}
inline ::std::string* person::release_desp() {
  clear_has_desp();
  if (desp_ == &::google::protobuf::internal::kEmptyString) {
    return NULL;
  } else {
    ::std::string* temp = desp_;
    desp_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
    return temp;
  }
}
inline void person::set_allocated_desp(::std::string* desp) {
  if (desp_ != &::google::protobuf::internal::kEmptyString) {
    delete desp_;
  }
  if (desp) {
    set_has_desp();
    desp_ = desp;
  } else {
    clear_has_desp();
    desp_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
  }
}

// repeated .kv dict = 5;
inline int person::dict_size() const {
  return dict_.size();
}
inline void person::clear_dict() {
  dict_.Clear();
}
inline const ::kv& person::dict(int index) const {
  return dict_.Get(index);
}
inline ::kv* person::mutable_dict(int index) {
  return dict_.Mutable(index);
}
inline ::kv* person::add_dict() {
  return dict_.Add();
}
inline const ::google::protobuf::RepeatedPtrField< ::kv >&
person::dict() const {
  return dict_;
}
inline ::google::protobuf::RepeatedPtrField< ::kv >*
person::mutable_dict() {
  return &dict_;
}

// -------------------------------------------------------------------

// family

// repeated .person person = 1;
inline int family::person_size() const {
  return person_.size();
}
inline void family::clear_person() {
  person_.Clear();
}
inline const ::person& family::person(int index) const {
  return person_.Get(index);
}
inline ::person* family::mutable_person(int index) {
  return person_.Mutable(index);
}
inline ::person* family::add_person() {
  return person_.Add();
}
inline const ::google::protobuf::RepeatedPtrField< ::person >&
family::person() const {
  return person_;
}
inline ::google::protobuf::RepeatedPtrField< ::person >*
family::mutable_person() {
  return &person_;
}

// -------------------------------------------------------------------

// int_kv

// optional int32 key = 1;
inline bool int_kv::has_key() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void int_kv::set_has_key() {
  _has_bits_[0] |= 0x00000001u;
}
inline void int_kv::clear_has_key() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void int_kv::clear_key() {
  key_ = 0;
  clear_has_key();
}
inline ::google::protobuf::int32 int_kv::key() const {
  return key_;
}
inline void int_kv::set_key(::google::protobuf::int32 value) {
  set_has_key();
  key_ = value;
}

// optional int32 value = 2;
inline bool int_kv::has_value() const {
  return (_has_bits_[0] & 0x00000002u) != 0;
}
inline void int_kv::set_has_value() {
  _has_bits_[0] |= 0x00000002u;
}
inline void int_kv::clear_has_value() {
  _has_bits_[0] &= ~0x00000002u;
}
inline void int_kv::clear_value() {
  value_ = 0;
  clear_has_value();
}
inline ::google::protobuf::int32 int_kv::value() const {
  return value_;
}
inline void int_kv::set_value(::google::protobuf::int32 value) {
  set_has_value();
  value_ = value;
}

// -------------------------------------------------------------------

// user

// optional int32 uid = 1;
inline bool user::has_uid() const {
  return (_has_bits_[0] & 0x00000001u) != 0;
}
inline void user::set_has_uid() {
  _has_bits_[0] |= 0x00000001u;
}
inline void user::clear_has_uid() {
  _has_bits_[0] &= ~0x00000001u;
}
inline void user::clear_uid() {
  uid_ = 0;
  clear_has_uid();
}
inline ::google::protobuf::int32 user::uid() const {
  return uid_;
}
inline void user::set_uid(::google::protobuf::int32 value) {
  set_has_uid();
  uid_ = value;
}

// optional string name = 2;
inline bool user::has_name() const {
  return (_has_bits_[0] & 0x00000002u) != 0;
}
inline void user::set_has_name() {
  _has_bits_[0] |= 0x00000002u;
}
inline void user::clear_has_name() {
  _has_bits_[0] &= ~0x00000002u;
}
inline void user::clear_name() {
  if (name_ != &::google::protobuf::internal::kEmptyString) {
    name_->clear();
  }
  clear_has_name();
}
inline const ::std::string& user::name() const {
  return *name_;
}
inline void user::set_name(const ::std::string& value) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(value);
}
inline void user::set_name(const char* value) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(value);
}
inline void user::set_name(const char* value, size_t size) {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  name_->assign(reinterpret_cast<const char*>(value), size);
}
inline ::std::string* user::mutable_name() {
  set_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    name_ = new ::std::string;
  }
  return name_;
}
inline ::std::string* user::release_name() {
  clear_has_name();
  if (name_ == &::google::protobuf::internal::kEmptyString) {
    return NULL;
  } else {
    ::std::string* temp = name_;
    name_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
    return temp;
  }
}
inline void user::set_allocated_name(::std::string* name) {
  if (name_ != &::google::protobuf::internal::kEmptyString) {
    delete name_;
  }
  if (name) {
    set_has_name();
    name_ = name;
  } else {
    clear_has_name();
    name_ = const_cast< ::std::string*>(&::google::protobuf::internal::kEmptyString);
  }
}

// optional .gender gener = 3;
inline bool user::has_gener() const {
  return (_has_bits_[0] & 0x00000004u) != 0;
}
inline void user::set_has_gener() {
  _has_bits_[0] |= 0x00000004u;
}
inline void user::clear_has_gener() {
  _has_bits_[0] &= ~0x00000004u;
}
inline void user::clear_gener() {
  gener_ = 1;
  clear_has_gener();
}
inline ::gender user::gener() const {
  return static_cast< ::gender >(gener_);
}
inline void user::set_gener(::gender value) {
  assert(::gender_IsValid(value));
  set_has_gener();
  gener_ = value;
}

// repeated .int_kv bags = 4;
inline int user::bags_size() const {
  return bags_.size();
}
inline void user::clear_bags() {
  bags_.Clear();
}
inline const ::int_kv& user::bags(int index) const {
  return bags_.Get(index);
}
inline ::int_kv* user::mutable_bags(int index) {
  return bags_.Mutable(index);
}
inline ::int_kv* user::add_bags() {
  return bags_.Add();
}
inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
user::bags() const {
  return bags_;
}
inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
user::mutable_bags() {
  return &bags_;
}

// repeated .int_kv heroes = 5;
inline int user::heroes_size() const {
  return heroes_.size();
}
inline void user::clear_heroes() {
  heroes_.Clear();
}
inline const ::int_kv& user::heroes(int index) const {
  return heroes_.Get(index);
}
inline ::int_kv* user::mutable_heroes(int index) {
  return heroes_.Mutable(index);
}
inline ::int_kv* user::add_heroes() {
  return heroes_.Add();
}
inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
user::heroes() const {
  return heroes_;
}
inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
user::mutable_heroes() {
  return &heroes_;
}

// repeated .int_kv skills = 6;
inline int user::skills_size() const {
  return skills_.size();
}
inline void user::clear_skills() {
  skills_.Clear();
}
inline const ::int_kv& user::skills(int index) const {
  return skills_.Get(index);
}
inline ::int_kv* user::mutable_skills(int index) {
  return skills_.Mutable(index);
}
inline ::int_kv* user::add_skills() {
  return skills_.Add();
}
inline const ::google::protobuf::RepeatedPtrField< ::int_kv >&
user::skills() const {
  return skills_;
}
inline ::google::protobuf::RepeatedPtrField< ::int_kv >*
user::mutable_skills() {
  return &skills_;
}


// @@protoc_insertion_point(namespace_scope)

#ifndef SWIG
namespace google {
namespace protobuf {

template <>
inline const EnumDescriptor* GetEnumDescriptor< ::gender>() {
  return ::gender_descriptor();
}
template <>
inline const EnumDescriptor* GetEnumDescriptor< ::point_type>() {
  return ::point_type_descriptor();
}

}  // namespace google
}  // namespace protobuf
#endif  // SWIG

// @@protoc_insertion_point(global_scope)

#endif  // PROTOBUF_game_2eproto__INCLUDED
