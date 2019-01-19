CREATE TABLE `JClass` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `module` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `NIDX_JClass_name` (`name`)
);

CREATE TABLE `JMethod` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `returntype` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `clzname` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  `module` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `JField` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `updatedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `_ClassDependences` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassDependences_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassDependences_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JClass` (`id`) ON DELETE CASCADE
);

CREATE TABLE `_ClassFields` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassFields_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassFields_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JField` (`id`) ON DELETE CASCADE
);

CREATE TABLE `_ClassMethods` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassMethods_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassMethods_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
);


CREATE TABLE `_ClassParent` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_ClassParent_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JClass` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_ClassParent_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JClass` (`id`) ON DELETE CASCADE
);

CREATE TABLE `_MethodCallees` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_MethodCallees_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_MethodCallees_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
);

CREATE TABLE `_MethodCaller` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `A` (`a`),
  KEY `B` (`b`),
  CONSTRAINT `_MethodCaller_ibfk_1` FOREIGN KEY (`a`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE,
  CONSTRAINT `_MethodCaller_ibfk_2` FOREIGN KEY (`b`) REFERENCES `JMethod` (`id`) ON DELETE CASCADE
);