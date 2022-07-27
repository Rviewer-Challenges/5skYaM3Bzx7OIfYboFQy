// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class FeedSource extends DataClass implements Insertable<FeedSource> {
  final int id;
  final String name;
  final String feedURl;
  final bool enabled;
  FeedSource(
      {required this.id,
      required this.name,
      required this.feedURl,
      required this.enabled});
  factory FeedSource.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FeedSource(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      feedURl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}feed_u_rl'])!,
      enabled: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enabled'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['feed_u_rl'] = Variable<String>(feedURl);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  FeedSourcesCompanion toCompanion(bool nullToAbsent) {
    return FeedSourcesCompanion(
      id: Value(id),
      name: Value(name),
      feedURl: Value(feedURl),
      enabled: Value(enabled),
    );
  }

  factory FeedSource.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedSource(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      feedURl: serializer.fromJson<String>(json['feedURl']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'feedURl': serializer.toJson<String>(feedURl),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  FeedSource copyWith(
          {int? id, String? name, String? feedURl, bool? enabled}) =>
      FeedSource(
        id: id ?? this.id,
        name: name ?? this.name,
        feedURl: feedURl ?? this.feedURl,
        enabled: enabled ?? this.enabled,
      );
  @override
  String toString() {
    return (StringBuffer('FeedSource(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('feedURl: $feedURl, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, feedURl, enabled);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedSource &&
          other.id == this.id &&
          other.name == this.name &&
          other.feedURl == this.feedURl &&
          other.enabled == this.enabled);
}

class FeedSourcesCompanion extends UpdateCompanion<FeedSource> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> feedURl;
  final Value<bool> enabled;
  const FeedSourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.feedURl = const Value.absent(),
    this.enabled = const Value.absent(),
  });
  FeedSourcesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String feedURl,
    this.enabled = const Value.absent(),
  })  : name = Value(name),
        feedURl = Value(feedURl);
  static Insertable<FeedSource> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? feedURl,
    Expression<bool>? enabled,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (feedURl != null) 'feed_u_rl': feedURl,
      if (enabled != null) 'enabled': enabled,
    });
  }

  FeedSourcesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? feedURl,
      Value<bool>? enabled}) {
    return FeedSourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      feedURl: feedURl ?? this.feedURl,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (feedURl.present) {
      map['feed_u_rl'] = Variable<String>(feedURl.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedSourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('feedURl: $feedURl, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }
}

class $FeedSourcesTable extends FeedSources
    with TableInfo<$FeedSourcesTable, FeedSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedSourcesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _feedURlMeta = const VerificationMeta('feedURl');
  @override
  late final GeneratedColumn<String?> feedURl = GeneratedColumn<String?>(
      'feed_u_rl', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _enabledMeta = const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool?> enabled = GeneratedColumn<bool?>(
      'enabled', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (enabled IN (0, 1))',
      defaultValue: const Constant(true));
  @override
  List<GeneratedColumn> get $columns => [id, name, feedURl, enabled];
  @override
  String get aliasedName => _alias ?? 'feed_sources';
  @override
  String get actualTableName => 'feed_sources';
  @override
  VerificationContext validateIntegrity(Insertable<FeedSource> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('feed_u_rl')) {
      context.handle(_feedURlMeta,
          feedURl.isAcceptableOrUnknown(data['feed_u_rl']!, _feedURlMeta));
    } else if (isInserting) {
      context.missing(_feedURlMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FeedSource.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FeedSourcesTable createAlias(String alias) {
    return $FeedSourcesTable(attachedDatabase, alias);
  }
}

class FeedItem extends DataClass implements Insertable<FeedItem> {
  final String id;
  final String title;
  final String link;
  final DateTime date;
  final String description;
  final String author;
  final String? publisher;
  final String? thumbnailUrl;
  final bool isFav;
  final int sourceId;
  FeedItem(
      {required this.id,
      required this.title,
      required this.link,
      required this.date,
      required this.description,
      required this.author,
      this.publisher,
      this.thumbnailUrl,
      required this.isFav,
      required this.sourceId});
  factory FeedItem.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return FeedItem(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      link: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}link'])!,
      date: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}date'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      publisher: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}publisher']),
      thumbnailUrl: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}thumbnail_url']),
      isFav: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_fav'])!,
      sourceId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}source_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['link'] = Variable<String>(link);
    map['date'] = Variable<DateTime>(date);
    map['description'] = Variable<String>(description);
    map['author'] = Variable<String>(author);
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String?>(publisher);
    }
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String?>(thumbnailUrl);
    }
    map['is_fav'] = Variable<bool>(isFav);
    map['source_id'] = Variable<int>(sourceId);
    return map;
  }

  FeedItemsCompanion toCompanion(bool nullToAbsent) {
    return FeedItemsCompanion(
      id: Value(id),
      title: Value(title),
      link: Value(link),
      date: Value(date),
      description: Value(description),
      author: Value(author),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      isFav: Value(isFav),
      sourceId: Value(sourceId),
    );
  }

  factory FeedItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedItem(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      link: serializer.fromJson<String>(json['link']),
      date: serializer.fromJson<DateTime>(json['date']),
      description: serializer.fromJson<String>(json['description']),
      author: serializer.fromJson<String>(json['author']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      isFav: serializer.fromJson<bool>(json['isFav']),
      sourceId: serializer.fromJson<int>(json['sourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'link': serializer.toJson<String>(link),
      'date': serializer.toJson<DateTime>(date),
      'description': serializer.toJson<String>(description),
      'author': serializer.toJson<String>(author),
      'publisher': serializer.toJson<String?>(publisher),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'isFav': serializer.toJson<bool>(isFav),
      'sourceId': serializer.toJson<int>(sourceId),
    };
  }

  FeedItem copyWith(
          {String? id,
          String? title,
          String? link,
          DateTime? date,
          String? description,
          String? author,
          String? publisher,
          String? thumbnailUrl,
          bool? isFav,
          int? sourceId}) =>
      FeedItem(
        id: id ?? this.id,
        title: title ?? this.title,
        link: link ?? this.link,
        date: date ?? this.date,
        description: description ?? this.description,
        author: author ?? this.author,
        publisher: publisher ?? this.publisher,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        isFav: isFav ?? this.isFav,
        sourceId: sourceId ?? this.sourceId,
      );
  @override
  String toString() {
    return (StringBuffer('FeedItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('isFav: $isFav, ')
          ..write('sourceId: $sourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, link, date, description, author,
      publisher, thumbnailUrl, isFav, sourceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.link == this.link &&
          other.date == this.date &&
          other.description == this.description &&
          other.author == this.author &&
          other.publisher == this.publisher &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.isFav == this.isFav &&
          other.sourceId == this.sourceId);
}

class FeedItemsCompanion extends UpdateCompanion<FeedItem> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> link;
  final Value<DateTime> date;
  final Value<String> description;
  final Value<String> author;
  final Value<String?> publisher;
  final Value<String?> thumbnailUrl;
  final Value<bool> isFav;
  final Value<int> sourceId;
  const FeedItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.date = const Value.absent(),
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.publisher = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.isFav = const Value.absent(),
    this.sourceId = const Value.absent(),
  });
  FeedItemsCompanion.insert({
    required String id,
    required String title,
    required String link,
    required DateTime date,
    required String description,
    required String author,
    this.publisher = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.isFav = const Value.absent(),
    required int sourceId,
  })  : id = Value(id),
        title = Value(title),
        link = Value(link),
        date = Value(date),
        description = Value(description),
        author = Value(author),
        sourceId = Value(sourceId);
  static Insertable<FeedItem> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? link,
    Expression<DateTime>? date,
    Expression<String>? description,
    Expression<String>? author,
    Expression<String?>? publisher,
    Expression<String?>? thumbnailUrl,
    Expression<bool>? isFav,
    Expression<int>? sourceId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (date != null) 'date': date,
      if (description != null) 'description': description,
      if (author != null) 'author': author,
      if (publisher != null) 'publisher': publisher,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (isFav != null) 'is_fav': isFav,
      if (sourceId != null) 'source_id': sourceId,
    });
  }

  FeedItemsCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? link,
      Value<DateTime>? date,
      Value<String>? description,
      Value<String>? author,
      Value<String?>? publisher,
      Value<String?>? thumbnailUrl,
      Value<bool>? isFav,
      Value<int>? sourceId}) {
    return FeedItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      link: link ?? this.link,
      date: date ?? this.date,
      description: description ?? this.description,
      author: author ?? this.author,
      publisher: publisher ?? this.publisher,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      isFav: isFav ?? this.isFav,
      sourceId: sourceId ?? this.sourceId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String?>(publisher.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String?>(thumbnailUrl.value);
    }
    if (isFav.present) {
      map['is_fav'] = Variable<bool>(isFav.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('date: $date, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('publisher: $publisher, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('isFav: $isFav, ')
          ..write('sourceId: $sourceId')
          ..write(')'))
        .toString();
  }
}

class $FeedItemsTable extends FeedItems
    with TableInfo<$FeedItemsTable, FeedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedItemsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String?> link = GeneratedColumn<String?>(
      'link', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime?> date = GeneratedColumn<DateTime?>(
      'date', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _publisherMeta = const VerificationMeta('publisher');
  @override
  late final GeneratedColumn<String?> publisher = GeneratedColumn<String?>(
      'publisher', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _thumbnailUrlMeta =
      const VerificationMeta('thumbnailUrl');
  @override
  late final GeneratedColumn<String?> thumbnailUrl = GeneratedColumn<String?>(
      'thumbnail_url', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _isFavMeta = const VerificationMeta('isFav');
  @override
  late final GeneratedColumn<bool?> isFav = GeneratedColumn<bool?>(
      'is_fav', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_fav IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _sourceIdMeta = const VerificationMeta('sourceId');
  @override
  late final GeneratedColumn<int?> sourceId = GeneratedColumn<int?>(
      'source_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES feed_sources (id)');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        link,
        date,
        description,
        author,
        publisher,
        thumbnailUrl,
        isFav,
        sourceId
      ];
  @override
  String get aliasedName => _alias ?? 'feed_items';
  @override
  String get actualTableName => 'feed_items';
  @override
  VerificationContext validateIntegrity(Insertable<FeedItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('publisher')) {
      context.handle(_publisherMeta,
          publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta));
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
          _thumbnailUrlMeta,
          thumbnailUrl.isAcceptableOrUnknown(
              data['thumbnail_url']!, _thumbnailUrlMeta));
    }
    if (data.containsKey('is_fav')) {
      context.handle(
          _isFavMeta, isFav.isAcceptableOrUnknown(data['is_fav']!, _isFavMeta));
    }
    if (data.containsKey('source_id')) {
      context.handle(_sourceIdMeta,
          sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta));
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    return FeedItem.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FeedItemsTable createAlias(String alias) {
    return $FeedItemsTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $FeedSourcesTable feedSources = $FeedSourcesTable(this);
  late final $FeedItemsTable feedItems = $FeedItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [feedSources, feedItems];
}
