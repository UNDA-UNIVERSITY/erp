-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 21 Sep 2019 pada 11.34
-- Versi server: 10.2.27-MariaDB
-- Versi PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `erp_database`
--
CREATE DATABASE IF NOT EXISTS `erp_database` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `erp_database`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_account`
--

CREATE TABLE `accounting_account` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `pcg_subtype` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `fk_accounting_category` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_bookkeeping`
--

CREATE TABLE `accounting_bookkeeping` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `piece_num` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_bookkeeping_tmp`
--

CREATE TABLE `accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_fiscalyear`
--

CREATE TABLE `accounting_fiscalyear` (
  `rowid` int(11) NOT NULL,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_journal`
--

CREATE TABLE `accounting_journal` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT 1,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `accounting_system`
--

CREATE TABLE `accounting_system` (
  `rowid` int(11) NOT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint(6) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `actioncomm`
--

CREATE TABLE `actioncomm` (
  `id` int(11) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `fk_user_action` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `fulldayevent` smallint(6) NOT NULL DEFAULT 0,
  `punctual` smallint(6) NOT NULL DEFAULT 1,
  `percent` smallint(6) NOT NULL DEFAULT 0,
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `actioncomm_extrafields`
--

CREATE TABLE `actioncomm_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `actioncomm_reminder`
--

CREATE TABLE `actioncomm_reminder` (
  `rowid` int(11) NOT NULL,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `actioncomm_resources`
--

CREATE TABLE `actioncomm_resources` (
  `rowid` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `adherent`
--

CREATE TABLE `adherent` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `public` smallint(6) NOT NULL DEFAULT 0,
  `datefin` datetime DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `adherent_extrafields`
--

CREATE TABLE `adherent_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `adherent_type`
--

CREATE TABLE `adherent_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `libelle` varchar(50) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT 'yes',
  `vote` varchar(3) NOT NULL DEFAULT 'yes',
  `note` text DEFAULT NULL,
  `mail_valid` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `adherent_type_extrafields`
--

CREATE TABLE `adherent_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `advtargetemailing`
--

CREATE TABLE `advtargetemailing` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) NOT NULL,
  `filtervalue` text DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `asset`
--

CREATE TABLE `asset` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `amount_ht` double(24,8) DEFAULT NULL,
  `amount_vat` double(24,8) DEFAULT NULL,
  `fk_asset_type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `asset_extrafields`
--

CREATE TABLE `asset_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `asset_type`
--

CREATE TABLE `asset_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(50) NOT NULL,
  `accountancy_code_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_expense` varchar(32) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `asset_type_extrafields`
--

CREATE TABLE `asset_type_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank`
--

CREATE TABLE `bank` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT 0,
  `note` text DEFAULT NULL,
  `fk_bordereau` int(11) DEFAULT 0,
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_account`
--

CREATE TABLE `bank_account` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(12) NOT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT 0,
  `clos` smallint(6) NOT NULL DEFAULT 0,
  `rappro` smallint(6) DEFAULT 1,
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int(11) DEFAULT 0,
  `min_desired` int(11) DEFAULT 0,
  `comment` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_account_extrafields`
--

CREATE TABLE `bank_account_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_categ`
--

CREATE TABLE `bank_categ` (
  `rowid` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_class`
--

CREATE TABLE `bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bank_url`
--

CREATE TABLE `bank_url` (
  `rowid` int(11) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blockedlog`
--

CREATE TABLE `blockedlog` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `action` varchar(50) DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_line` varchar(100) NOT NULL,
  `object_data` text DEFAULT NULL,
  `certified` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `blockedlog_authority`
--

CREATE TABLE `blockedlog_authority` (
  `rowid` int(11) NOT NULL,
  `blockchain` longtext NOT NULL,
  `signature` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom_bom`
--

CREATE TABLE `bom_bom` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(8,4) DEFAULT 1.0000,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom_bomline`
--

CREATE TABLE `bom_bomline` (
  `rowid` int(11) NOT NULL,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `efficiency` double(8,4) NOT NULL DEFAULT 1.0000,
  `position` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom_bomline_extrafields`
--

CREATE TABLE `bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bom_bom_extrafields`
--

CREATE TABLE `bom_bom_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookmark`
--

CREATE TABLE `bookmark` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bordereau_cheque`
--

CREATE TABLE `bordereau_cheque` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `boxes`
--

CREATE TABLE `boxes` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `boxes_def`
--

CREATE TABLE `boxes_def` (
  `rowid` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` varchar(130) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `budget`
--

CREATE TABLE `budget` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `budget_lines`
--

CREATE TABLE `budget_lines` (
  `rowid` int(11) NOT NULL,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie`
--

CREATE TABLE `categorie` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) NOT NULL DEFAULT 0,
  `label` varchar(180) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories_extrafields`
--

CREATE TABLE `categories_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_account`
--

CREATE TABLE `categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_contact`
--

CREATE TABLE `categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_fournisseur`
--

CREATE TABLE `categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_lang`
--

CREATE TABLE `categorie_lang` (
  `rowid` int(11) NOT NULL,
  `fk_category` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_member`
--

CREATE TABLE `categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_product`
--

CREATE TABLE `categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_project`
--

CREATE TABLE `categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_societe`
--

CREATE TABLE `categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `categorie_user`
--

CREATE TABLE `categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `chargesociales`
--

CREATE TABLE `chargesociales` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande`
--

CREATE TABLE `commande` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `facture` tinyint(4) DEFAULT 0,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commandedet`
--

CREATE TABLE `commandedet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commandedet_extrafields`
--

CREATE TABLE `commandedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_extrafields`
--

CREATE TABLE `commande_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseur`
--

CREATE TABLE `commande_fournisseur` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `amount_ht` double(24,8) DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT 0,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseurdet`
--

CREATE TABLE `commande_fournisseurdet` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseurdet_extrafields`
--

CREATE TABLE `commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseur_dispatch`
--

CREATE TABLE `commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_reception` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseur_dispatch_extrafields`
--

CREATE TABLE `commande_fournisseur_dispatch_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseur_extrafields`
--

CREATE TABLE `commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `commande_fournisseur_log`
--

CREATE TABLE `commande_fournisseur_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` text NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `import_key` varchar(125) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `const`
--

CREATE TABLE `const` (
  `rowid` int(11) NOT NULL,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contrat`
--

CREATE TABLE `contrat` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `mise_en_service` datetime DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_mise_en_service` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contratdet`
--

CREATE TABLE `contratdet` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT 0,
  `label` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 1,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT 0,
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contratdet_extrafields`
--

CREATE TABLE `contratdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contratdet_log`
--

CREATE TABLE `contratdet_log` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `contrat_extrafields`
--

CREATE TABLE `contrat_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cronjob`
--

CREATE TABLE `cronjob` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` text NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text DEFAULT NULL,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text DEFAULT NULL,
  `lastoutput` text DEFAULT NULL,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT 0,
  `maxrun` int(11) NOT NULL DEFAULT 0,
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `processing` int(11) NOT NULL DEFAULT 0,
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `libname` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_accounting_category`
--

CREATE TABLE `c_accounting_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT 0,
  `category_type` tinyint(4) NOT NULL DEFAULT 0,
  `formula` varchar(255) NOT NULL,
  `position` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_actioncomm`
--

CREATE TABLE `c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(48) NOT NULL,
  `module` varchar(16) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_action_trigger`
--

CREATE TABLE `c_action_trigger` (
  `rowid` int(11) NOT NULL,
  `elementtype` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_availability`
--

CREATE TABLE `c_availability` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) NOT NULL,
  `label` varchar(60) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_barcode_type`
--

CREATE TABLE `c_barcode_type` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `libelle` varchar(50) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_chargesociales`
--

CREATE TABLE `c_chargesociales` (
  `id` int(11) NOT NULL,
  `libelle` varchar(80) DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_civility`
--

CREATE TABLE `c_civility` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_country`
--

CREATE TABLE `c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `favorite` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_currencies`
--

CREATE TABLE `c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(64) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_departements`
--

CREATE TABLE `c_departements` (
  `rowid` int(11) NOT NULL,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_ecotaxe`
--

CREATE TABLE `c_ecotaxe` (
  `rowid` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_effectif`
--

CREATE TABLE `c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_email_senderprofile`
--

CREATE TABLE `c_email_senderprofile` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `private` smallint(6) NOT NULL DEFAULT 0,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text DEFAULT NULL,
  `position` smallint(6) DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_email_templates`
--

CREATE TABLE `c_email_templates` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(180) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `topic` text DEFAULT NULL,
  `joinfiles` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `content_lines` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_exp_tax_cat`
--

CREATE TABLE `c_exp_tax_cat` (
  `rowid` int(11) NOT NULL,
  `label` varchar(48) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_exp_tax_range`
--

CREATE TABLE `c_exp_tax_range` (
  `rowid` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 1,
  `range_ik` double NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1,
  `active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_field_list`
--

CREATE TABLE `c_field_list` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `element` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT 1,
  `search` tinyint(4) NOT NULL DEFAULT 0,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `enabled` varchar(255) DEFAULT '1',
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_format_cards`
--

CREATE TABLE `c_format_cards` (
  `rowid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_forme_juridique`
--

CREATE TABLE `c_forme_juridique` (
  `rowid` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_holiday_types`
--

CREATE TABLE `c_holiday_types` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newByMonth` double(8,5) NOT NULL DEFAULT 0.00000,
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_hrm_department`
--

CREATE TABLE `c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_hrm_function`
--

CREATE TABLE `c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT 0,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_incoterms`
--

CREATE TABLE `c_incoterms` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_input_method`
--

CREATE TABLE `c_input_method` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_input_reason`
--

CREATE TABLE `c_input_reason` (
  `rowid` int(11) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_lead_status`
--

CREATE TABLE `c_lead_status` (
  `rowid` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_paiement`
--

CREATE TABLE `c_paiement` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(6) NOT NULL,
  `libelle` varchar(62) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_paper_format`
--

CREATE TABLE `c_paper_format` (
  `rowid` int(11) NOT NULL,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `width` float(6,2) DEFAULT 0.00,
  `height` float(6,2) DEFAULT 0.00,
  `unit` varchar(5) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_payment_term`
--

CREATE TABLE `c_payment_term` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 1,
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text DEFAULT NULL,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_price_expression`
--

CREATE TABLE `c_price_expression` (
  `rowid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `expression` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_price_global_variable`
--

CREATE TABLE `c_price_global_variable` (
  `rowid` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `value` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_price_global_variable_updater`
--

CREATE TABLE `c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `parameters` text DEFAULT NULL,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT 0,
  `next_update` int(11) DEFAULT 0,
  `last_status` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_propalst`
--

CREATE TABLE `c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_prospectlevel`
--

CREATE TABLE `c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_regions`
--

CREATE TABLE `c_regions` (
  `rowid` int(11) NOT NULL,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_revenuestamp`
--

CREATE TABLE `c_revenuestamp` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_shipment_mode`
--

CREATE TABLE `c_shipment_mode` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `code` varchar(30) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT 0,
  `module` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_stcomm`
--

CREATE TABLE `c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_ticket_category`
--

CREATE TABLE `c_ticket_category` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_ticket_severity`
--

CREATE TABLE `c_ticket_severity` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_ticket_type`
--

CREATE TABLE `c_ticket_type` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT 1,
  `use_default` int(11) DEFAULT 1,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_tva`
--

CREATE TABLE `c_tva` (
  `rowid` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `code` varchar(10) DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_typent`
--

CREATE TABLE `c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(64) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_type_contact`
--

CREATE TABLE `c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_type_container`
--

CREATE TABLE `c_type_container` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(64) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_type_fees`
--

CREATE TABLE `c_type_fees` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_type_resource`
--

CREATE TABLE `c_type_resource` (
  `rowid` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_units`
--

CREATE TABLE `c_units` (
  `rowid` int(11) NOT NULL,
  `code` varchar(3) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `c_ziptown`
--

CREATE TABLE `c_ziptown` (
  `rowid` int(11) NOT NULL,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT 0,
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `default_values`
--

CREATE TABLE `default_values` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `deplacement`
--

CREATE TABLE `deplacement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 1,
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `document_model`
--

CREATE TABLE `document_model` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `type` varchar(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `don`
--

CREATE TABLE `don` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `phone_mobile` varchar(24) DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT 1,
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `don_extrafields`
--

CREATE TABLE `don_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ecm_directories`
--

CREATE TABLE `ecm_directories` (
  `rowid` int(11) NOT NULL,
  `label` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT 0,
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `date_m` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ecm_files`
--

CREATE TABLE `ecm_files` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(32) DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` varchar(750) DEFAULT NULL,
  `cover` text DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `date_m` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `element_contact`
--

CREATE TABLE `element_contact` (
  `rowid` int(11) NOT NULL,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT 5,
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `element_element`
--

CREATE TABLE `element_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `element_resources`
--

CREATE TABLE `element_resources` (
  `rowid` int(11) NOT NULL,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `emailcollector_emailcollector`
--

CREATE TABLE `emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL,
  `target_directory` varchar(255) DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT 100,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` varchar(255) DEFAULT NULL,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `emailcollector_emailcollectoraction`
--

CREATE TABLE `emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `emailcollector_emailcollectorfilter`
--

CREATE TABLE `emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `entrepot`
--

CREATE TABLE `entrepot` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `entity` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `statut` tinyint(4) DEFAULT 1,
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `establishment`
--

CREATE TABLE `establishment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `events`
--

CREATE TABLE `events` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `event_element`
--

CREATE TABLE `event_element` (
  `rowid` int(11) NOT NULL,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expedition`
--

CREATE TABLE `expedition` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expeditiondet`
--

CREATE TABLE `expeditiondet` (
  `rowid` int(11) NOT NULL,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expeditiondet_batch`
--

CREATE TABLE `expeditiondet_batch` (
  `rowid` int(11) NOT NULL,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `fk_origin_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expeditiondet_extrafields`
--

CREATE TABLE `expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expedition_extrafields`
--

CREATE TABLE `expedition_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expensereport`
--

CREATE TABLE `expensereport` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(50) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expensereport_det`
--

CREATE TABLE `expensereport_det` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int(11) DEFAULT -1,
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT 0.00000000,
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_facture` int(11) DEFAULT 0,
  `fk_ecm_files` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expensereport_extrafields`
--

CREATE TABLE `expensereport_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expensereport_ik`
--

CREATE TABLE `expensereport_ik` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT 0,
  `fk_range` int(11) NOT NULL DEFAULT 0,
  `coef` double NOT NULL DEFAULT 0,
  `ikoffset` double NOT NULL DEFAULT 0,
  `active` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `expensereport_rules`
--

CREATE TABLE `expensereport_rules` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint(4) DEFAULT 0,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `export_compta`
--

CREATE TABLE `export_compta` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `export_model`
--

CREATE TABLE `export_model` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `field` text NOT NULL,
  `filter` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `extrafields`
--

CREATE TABLE `extrafields` (
  `rowid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text DEFAULT NULL,
  `fielddefault` varchar(255) DEFAULT NULL,
  `fieldunique` int(11) DEFAULT 0,
  `fieldrequired` int(11) DEFAULT 0,
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `pos` int(11) DEFAULT 0,
  `alwayseditable` int(11) DEFAULT 0,
  `param` text DEFAULT NULL,
  `list` varchar(255) DEFAULT '1',
  `totalizable` tinyint(1) DEFAULT 0,
  `langs` varchar(64) DEFAULT NULL,
  `help` text DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture`
--

CREATE TABLE `facture` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `increment` varchar(10) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT 1,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `situation_cycle_ref` smallint(6) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facturedet`
--

CREATE TABLE `facturedet` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `situation_percent` double DEFAULT NULL,
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facturedet_extrafields`
--

CREATE TABLE `facturedet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facturedet_rec`
--

CREATE TABLE `facturedet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT 0,
  `date_end_fill` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facturedet_rec_extrafields`
--

CREATE TABLE `facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_extrafields`
--

CREATE TABLE `facture_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_fourn`
--

CREATE TABLE `facture_fourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT 0,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double(24,8) DEFAULT 0.00000000,
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_fourn_det`
--

CREATE TABLE `facture_fourn_det` (
  `rowid` int(11) NOT NULL,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_fourn_det_extrafields`
--

CREATE TABLE `facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_fourn_extrafields`
--

CREATE TABLE `facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_rec`
--

CREATE TABLE `facture_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `suspended` int(11) DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `remise` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `revenuestamp` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT 0,
  `fk_mode_reglement` int(11) DEFAULT 0,
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `usenewprice` int(11) DEFAULT 0,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT 0,
  `generate_pdf` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `facture_rec_extrafields`
--

CREATE TABLE `facture_rec_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinter`
--

CREATE TABLE `fichinter` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT 0,
  `fk_contrat` int(11) DEFAULT 0,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinterdet`
--

CREATE TABLE `fichinterdet` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinterdet_extrafields`
--

CREATE TABLE `fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinterdet_rec`
--

CREATE TABLE `fichinterdet_rec` (
  `rowid` int(11) NOT NULL,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT 0,
  `fk_export_commpta` int(11) NOT NULL DEFAULT 0,
  `special_code` int(10) UNSIGNED DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinter_extrafields`
--

CREATE TABLE `fichinter_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `fichinter_rec`
--

CREATE TABLE `fichinter_rec` (
  `rowid` int(11) NOT NULL,
  `titre` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT 0,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modelpdf` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `holiday`
--

CREATE TABLE `holiday` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT 0,
  `statut` int(11) NOT NULL DEFAULT 1,
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `holiday_config`
--

CREATE TABLE `holiday_config` (
  `rowid` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `holiday_logs`
--

CREATE TABLE `holiday_logs` (
  `rowid` int(11) NOT NULL,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `holiday_users`
--

CREATE TABLE `holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `import_model`
--

CREATE TABLE `import_model` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT 0,
  `label` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `field` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 0,
  `ref` varchar(48) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `title` varchar(255) NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventorydet`
--

CREATE TABLE `inventorydet` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_inventory` int(11) DEFAULT 0,
  `fk_warehouse` int(11) DEFAULT 0,
  `fk_product` int(11) DEFAULT 0,
  `batch` varchar(30) DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `links`
--

CREATE TABLE `links` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `livraison`
--

CREATE TABLE `livraison` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `livraisondet`
--

CREATE TABLE `livraisondet` (
  `rowid` int(11) NOT NULL,
  `fk_livraison` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `rang` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `livraisondet_extrafields`
--

CREATE TABLE `livraisondet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `livraison_extrafields`
--

CREATE TABLE `livraison_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan`
--

CREATE TABLE `loan` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(80) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT 0.00000000,
  `insurance_amount` double(24,8) DEFAULT 0.00000000,
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `capital_position` double(24,8) DEFAULT 0.00000000,
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT 0,
  `accountancy_account_capital` varchar(32) DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) DEFAULT NULL,
  `accountancy_account_interest` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `loan_schedule`
--

CREATE TABLE `loan_schedule` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `localtax`
--

CREATE TABLE `localtax` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mailing`
--

CREATE TABLE `mailing` (
  `rowid` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `titre` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `sujet` varchar(128) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `bgcolor` varchar(8) DEFAULT NULL,
  `bgimage` varchar(255) DEFAULT NULL,
  `cible` varchar(60) DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) DEFAULT NULL,
  `email_replyto` varchar(160) DEFAULT NULL,
  `email_errorsto` varchar(160) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `joined_file1` varchar(255) DEFAULT NULL,
  `joined_file2` varchar(255) DEFAULT NULL,
  `joined_file3` varchar(255) DEFAULT NULL,
  `joined_file4` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mailing_cibles`
--

CREATE TABLE `mailing_cibles` (
  `rowid` int(11) NOT NULL,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) DEFAULT NULL,
  `firstname` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `source_url` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `error_text` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mailing_unsubscribe`
--

CREATE TABLE `mailing_unsubscribe` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `rowid` int(11) NOT NULL,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `module` varchar(64) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text DEFAULT NULL,
  `enabled` varchar(255) DEFAULT '1',
  `usertype` int(11) NOT NULL DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `multicurrency`
--

CREATE TABLE `multicurrency` (
  `rowid` int(11) NOT NULL,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `multicurrency_rate`
--

CREATE TABLE `multicurrency_rate` (
  `rowid` int(11) NOT NULL,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT 0,
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notify`
--

CREATE TABLE `notify` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notify_def`
--

CREATE TABLE `notify_def` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notify_def_object`
--

CREATE TABLE `notify_def_object` (
  `id` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_state`
--

CREATE TABLE `oauth_state` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth_token`
--

CREATE TABLE `oauth_token` (
  `rowid` int(11) NOT NULL,
  `service` varchar(36) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `tokenstring` text DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `onlinesignature`
--

CREATE TABLE `onlinesignature` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `object_type` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opensurvey_comments`
--

CREATE TABLE `opensurvey_comments` (
  `id_comment` int(10) UNSIGNED NOT NULL,
  `id_sondage` char(16) NOT NULL,
  `comment` text NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `usercomment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opensurvey_formquestions`
--

CREATE TABLE `opensurvey_formquestions` (
  `rowid` int(11) NOT NULL,
  `id_sondage` varchar(16) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `available_answers` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opensurvey_sondage`
--

CREATE TABLE `opensurvey_sondage` (
  `id_sondage` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `commentaires` text DEFAULT NULL,
  `mail_admin` varchar(128) DEFAULT NULL,
  `nom_admin` varchar(64) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `format` varchar(2) NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT 0,
  `allow_comments` tinyint(4) NOT NULL DEFAULT 1,
  `allow_spy` tinyint(4) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sujet` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opensurvey_user_formanswers`
--

CREATE TABLE `opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `opensurvey_user_studs`
--

CREATE TABLE `opensurvey_user_studs` (
  `id_users` int(11) NOT NULL,
  `nom` varchar(64) NOT NULL,
  `id_sondage` varchar(16) NOT NULL,
  `reponses` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `overwrite_trans`
--

CREATE TABLE `overwrite_trans` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paiement`
--

CREATE TABLE `paiement` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int(11) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `fk_export_compta` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paiementcharge`
--

CREATE TABLE `paiementcharge` (
  `rowid` int(11) NOT NULL,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paiementfourn`
--

CREATE TABLE `paiementfourn` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paiementfourn_facturefourn`
--

CREATE TABLE `paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `paiement_facture`
--

CREATE TABLE `paiement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_amount` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_donation`
--

CREATE TABLE `payment_donation` (
  `rowid` int(11) NOT NULL,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_expensereport`
--

CREATE TABLE `payment_expensereport` (
  `rowid` int(11) NOT NULL,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_loan`
--

CREATE TABLE `payment_loan` (
  `rowid` int(11) NOT NULL,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT 0.00000000,
  `amount_insurance` double(24,8) DEFAULT 0.00000000,
  `amount_interest` double(24,8) DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_salary`
--

CREATE TABLE `payment_salary` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payment_various`
--

CREATE TABLE `payment_various` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT 0,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pos_cash_fence`
--

CREATE TABLE `pos_cash_fence` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT 0.00000000,
  `cash` double(24,8) DEFAULT 0.00000000,
  `card` double(24,8) DEFAULT 0.00000000,
  `cheque` double(24,8) DEFAULT 0.00000000,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prelevement_bons`
--

CREATE TABLE `prelevement_bons` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(12) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `statut` smallint(6) DEFAULT 0,
  `credite` smallint(6) DEFAULT 0,
  `note` text DEFAULT NULL,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prelevement_facture`
--

CREATE TABLE `prelevement_facture` (
  `rowid` int(11) NOT NULL,
  `fk_facture` int(11) NOT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prelevement_facture_demande`
--

CREATE TABLE `prelevement_facture_demande` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_facture` int(11) NOT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT 0,
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prelevement_lignes`
--

CREATE TABLE `prelevement_lignes` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT 0,
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT 0.00000000,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `prelevement_rejet`
--

CREATE TABLE `prelevement_rejet` (
  `rowid` int(11) NOT NULL,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `afacturer` tinyint(4) DEFAULT 0,
  `fk_facture` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `printing`
--

CREATE TABLE `printing` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int(11) NOT NULL DEFAULT 1,
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product`
--

CREATE TABLE `product` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_parent` int(11) DEFAULT 0,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `tobuy` tinyint(4) DEFAULT 1,
  `onportal` tinyint(4) DEFAULT 0,
  `tobatch` tinyint(4) NOT NULL DEFAULT 0,
  `fk_product_type` int(11) DEFAULT 0,
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT 0,
  `fk_project` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_association`
--

CREATE TABLE `product_association` (
  `rowid` int(11) NOT NULL,
  `fk_product_pere` int(11) NOT NULL DEFAULT 0,
  `fk_product_fils` int(11) NOT NULL DEFAULT 0,
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attribute`
--

CREATE TABLE `product_attribute` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT 0,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attribute_combination`
--

CREATE TABLE `product_attribute_combination` (
  `rowid` int(11) NOT NULL,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` float NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` float NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attribute_combination2val`
--

CREATE TABLE `product_attribute_combination2val` (
  `rowid` int(11) NOT NULL,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_attribute_value`
--

CREATE TABLE `product_attribute_value` (
  `rowid` int(11) NOT NULL,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_batch`
--

CREATE TABLE `product_batch` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(30) NOT NULL,
  `qty` double NOT NULL DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_customer_price`
--

CREATE TABLE `product_customer_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_customer_price_log`
--

CREATE TABLE `product_customer_price_log` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT 0,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_ttc` double(24,8) DEFAULT 0.00000000,
  `price_min` double(24,8) DEFAULT 0.00000000,
  `price_min_ttc` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_extrafields`
--

CREATE TABLE `product_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_fournisseur_price`
--

CREATE TABLE `product_fournisseur_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `desc_fourn` text DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `charges` double(24,8) DEFAULT 0.00000000,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT 0,
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_fournisseur_price_log`
--

CREATE TABLE `product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_lang`
--

CREATE TABLE `product_lang` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL DEFAULT 0,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_lot`
--

CREATE TABLE `product_lot` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_lot_extrafields`
--

CREATE TABLE `product_lot_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_price`
--

CREATE TABLE `product_price` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT 1,
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT 0,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT 1,
  `price_by_qty` int(11) NOT NULL DEFAULT 0,
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_pricerules`
--

CREATE TABLE `product_pricerules` (
  `rowid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` float NOT NULL,
  `var_min_percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_price_by_qty`
--

CREATE TABLE `product_price_by_qty` (
  `rowid` int(11) NOT NULL,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT 0,
  `remise` double NOT NULL DEFAULT 0,
  `unitprice` double(24,8) DEFAULT 0.00000000,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_stock`
--

CREATE TABLE `product_stock` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `product_warehouse_properties`
--

CREATE TABLE `product_warehouse_properties` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` int(11) DEFAULT 0,
  `desiredstock` int(11) DEFAULT 0,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projet`
--

CREATE TABLE `projet` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT 0,
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `bill_time` int(11) DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projet_extrafields`
--

CREATE TABLE `projet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projet_task`
--

CREATE TABLE `projet_task` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `duration_effective` double DEFAULT 0,
  `planned_workload` double DEFAULT 0,
  `progress` int(11) DEFAULT 0,
  `priority` int(11) DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `rang` int(11) DEFAULT 0,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projet_task_extrafields`
--

CREATE TABLE `projet_task_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `projet_task_time`
--

CREATE TABLE `projet_task_time` (
  `rowid` int(11) NOT NULL,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_datehour` datetime DEFAULT NULL,
  `task_date_withhour` int(11) DEFAULT 0,
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `propal`
--

CREATE TABLE `propal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `propaldet`
--

CREATE TABLE `propaldet` (
  `rowid` int(11) NOT NULL,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `propaldet_extrafields`
--

CREATE TABLE `propaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `propal_extrafields`
--

CREATE TABLE `propal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `propal_merge_pdf_product`
--

CREATE TABLE `propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reception`
--

CREATE TABLE `reception` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_int` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(30) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT 0,
  `billed` smallint(6) DEFAULT 0,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reception_extrafields`
--

CREATE TABLE `reception_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resource`
--

CREATE TABLE `resource` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `note_public` text DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `resource_extrafields`
--

CREATE TABLE `resource_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rights_def`
--

CREATE TABLE `rights_def` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe`
--

CREATE TABLE `societe` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 0,
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT 0,
  `fk_pays` int(11) DEFAULT 0,
  `fk_account` int(11) DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT 0,
  `fk_typent` int(11) DEFAULT 0,
  `fk_forme_juridique` int(11) DEFAULT 0,
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT 0,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint(4) DEFAULT 0,
  `fournisseur` tinyint(4) DEFAULT 0,
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT 0,
  `customer_rate` double DEFAULT 0,
  `supplier_rate` double DEFAULT 0,
  `remise_client` double DEFAULT 0,
  `remise_supplier` double DEFAULT 0,
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT 1,
  `localtax1_assuj` tinyint(4) DEFAULT 0,
  `localtax1_value` double(6,3) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT 0,
  `localtax2_value` double(6,3) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT 0,
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_account`
--

CREATE TABLE `societe_account` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `key_account` varchar(128) DEFAULT NULL,
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_address`
--

CREATE TABLE `societe_address` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_commerciaux`
--

CREATE TABLE `societe_commerciaux` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_extrafields`
--

CREATE TABLE `societe_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_log`
--

CREATE TABLE `societe_log` (
  `id` int(11) NOT NULL,
  `datel` datetime DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_prices`
--

CREATE TABLE `societe_prices` (
  `rowid` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_remise`
--

CREATE TABLE `societe_remise` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_remise_except`
--

CREATE TABLE `societe_remise_except` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000,
  `tva_tx` double(6,3) NOT NULL DEFAULT 0.000,
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT 0.00000000,
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_remise_supplier`
--

CREATE TABLE `societe_remise_supplier` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(6,3) NOT NULL DEFAULT 0.000,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `societe_rib`
--

CREATE TABLE `societe_rib` (
  `rowid` int(11) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT 0,
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int(11) DEFAULT 0,
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `socpeople`
--

CREATE TABLE `socpeople` (
  `rowid` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT 0,
  `birthday` date DEFAULT NULL,
  `poste` varchar(80) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `jabberid` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT 0,
  `priv` smallint(6) NOT NULL DEFAULT 0,
  `fk_user_creat` int(11) DEFAULT 0,
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `socpeople_extrafields`
--

CREATE TABLE `socpeople_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stock_mouvement`
--

CREATE TABLE `stock_mouvement` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(30) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT 0.00000000,
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscription`
--

CREATE TABLE `subscription` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `fk_type` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_proposal`
--

CREATE TABLE `supplier_proposal` (
  `rowid` int(11) NOT NULL,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT 0,
  `price` double DEFAULT 0,
  `remise_percent` double DEFAULT 0,
  `remise_absolue` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `tva` double(24,8) DEFAULT 0.00000000,
  `localtax1` double(24,8) DEFAULT 0.00000000,
  `localtax2` double(24,8) DEFAULT 0.00000000,
  `total` double(24,8) DEFAULT 0.00000000,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT 1.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_proposaldet`
--

CREATE TABLE `supplier_proposaldet` (
  `rowid` int(11) NOT NULL,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT 0.000,
  `localtax1_tx` double(6,3) DEFAULT 0.000,
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT 0.000,
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT 0,
  `remise` double DEFAULT 0,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT 0.00000000,
  `total_ht` double(24,8) DEFAULT 0.00000000,
  `total_tva` double(24,8) DEFAULT 0.00000000,
  `total_localtax1` double(24,8) DEFAULT 0.00000000,
  `total_localtax2` double(24,8) DEFAULT 0.00000000,
  `total_ttc` double(24,8) DEFAULT 0.00000000,
  `product_type` int(11) DEFAULT 0,
  `info_bits` int(11) DEFAULT 0,
  `buy_price_ht` double(24,8) DEFAULT 0.00000000,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT 0,
  `rang` int(11) DEFAULT 0,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ht` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_tva` double(24,8) DEFAULT 0.00000000,
  `multicurrency_total_ttc` double(24,8) DEFAULT 0.00000000,
  `fk_unit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_proposaldet_extrafields`
--

CREATE TABLE `supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier_proposal_extrafields`
--

CREATE TABLE `supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `takepos_floor_tables`
--

CREATE TABLE `takepos_floor_tables` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `label` varchar(255) DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket`
--

CREATE TABLE `ticket` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `track_id` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT 0,
  `fk_project` int(11) DEFAULT 0,
  `origin_email` varchar(128) DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `timing` varchar(20) DEFAULT NULL,
  `type_code` varchar(32) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL,
  `severity_code` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket_extrafields`
--

CREATE TABLE `ticket_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tva`
--

CREATE TABLE `tva` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT 0.00000000,
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `note` text DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref_ext` varchar(50) DEFAULT NULL,
  `ref_int` varchar(50) DEFAULT NULL,
  `employee` tinyint(4) DEFAULT 1,
  `fk_establishment` int(11) DEFAULT 0,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT 0,
  `fk_country` int(11) DEFAULT 0,
  `birth` date DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `jabberid` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `admin` smallint(6) DEFAULT 0,
  `module_comm` smallint(6) DEFAULT 1,
  `module_compta` smallint(6) DEFAULT 1,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `note_public` text DEFAULT NULL,
  `note` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT 1,
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT 0,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT 0,
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `usergroup`
--

CREATE TABLE `usergroup` (
  `rowid` int(11) NOT NULL,
  `nom` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `note` text DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `usergroup_extrafields`
--

CREATE TABLE `usergroup_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `usergroup_rights`
--

CREATE TABLE `usergroup_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `usergroup_user`
--

CREATE TABLE `usergroup_user` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_alert`
--

CREATE TABLE `user_alert` (
  `rowid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_clicktodial`
--

CREATE TABLE `user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_employment`
--

CREATE TABLE `user_employment` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_extrafields`
--

CREATE TABLE `user_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_param`
--

CREATE TABLE `user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_rib`
--

CREATE TABLE `user_rib` (
  `rowid` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_rights`
--

CREATE TABLE `user_rights` (
  `rowid` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT 1,
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `website`
--

CREATE TABLE `website` (
  `rowid` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT 1,
  `ref` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `maincolor` varchar(16) DEFAULT NULL,
  `maincolorbis` varchar(16) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fk_default_home` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `website_extrafields`
--

CREATE TABLE `website_extrafields` (
  `rowid` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `website_page`
--

CREATE TABLE `website_page` (
  `rowid` int(11) NOT NULL,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) NOT NULL,
  `aliasalt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `htmlheader` text DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `grabbed_from` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `import_key` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `accounting_account`
--
ALTER TABLE `accounting_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  ADD KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  ADD KEY `idx_accounting_account_account_parent` (`account_parent`);

--
-- Indeks untuk tabel `accounting_bookkeeping`
--
ALTER TABLE `accounting_bookkeeping`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  ADD KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`),
  ADD KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`);

--
-- Indeks untuk tabel `accounting_bookkeeping_tmp`
--
ALTER TABLE `accounting_bookkeeping_tmp`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  ADD KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  ADD KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  ADD KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`);

--
-- Indeks untuk tabel `accounting_fiscalyear`
--
ALTER TABLE `accounting_fiscalyear`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `accounting_journal`
--
ALTER TABLE `accounting_journal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`);

--
-- Indeks untuk tabel `accounting_system`
--
ALTER TABLE `accounting_system`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`);

--
-- Indeks untuk tabel `actioncomm`
--
ALTER TABLE `actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  ADD KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  ADD KEY `idx_actioncomm_code` (`code`),
  ADD KEY `idx_actioncomm_fk_element` (`fk_element`),
  ADD KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  ADD KEY `idx_actioncomm_fk_project` (`fk_project`),
  ADD KEY `idx_actioncomm_datep` (`datep`),
  ADD KEY `idx_actioncomm_datep2` (`datep2`),
  ADD KEY `idx_actioncomm_recurid` (`recurid`),
  ADD KEY `idx_actioncomm_ref_ext` (`ref_ext`);

--
-- Indeks untuk tabel `actioncomm_extrafields`
--
ALTER TABLE `actioncomm_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_actioncomm_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `actioncomm_reminder`
--
ALTER TABLE `actioncomm_reminder`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  ADD KEY `idx_actioncomm_reminder_rowid` (`rowid`),
  ADD KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  ADD KEY `idx_actioncomm_reminder_fk_user` (`fk_user`);

--
-- Indeks untuk tabel `actioncomm_resources`
--
ALTER TABLE `actioncomm_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  ADD KEY `idx_actioncomm_resources_fk_element` (`fk_element`);

--
-- Indeks untuk tabel `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  ADD KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`);

--
-- Indeks untuk tabel `adherent_extrafields`
--
ALTER TABLE `adherent_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `adherent_type`
--
ALTER TABLE `adherent_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`);

--
-- Indeks untuk tabel `adherent_type_extrafields`
--
ALTER TABLE `adherent_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_adherent_type_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `advtargetemailing`
--
ALTER TABLE `advtargetemailing`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_advtargetemailing_name` (`name`);

--
-- Indeks untuk tabel `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_rowid` (`rowid`),
  ADD KEY `idx_asset_ref` (`ref`),
  ADD KEY `idx_asset_entity` (`entity`),
  ADD KEY `idx_asset_fk_asset_type` (`fk_asset_type`);

--
-- Indeks untuk tabel `asset_extrafields`
--
ALTER TABLE `asset_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `asset_type`
--
ALTER TABLE `asset_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_asset_type_label` (`label`,`entity`);

--
-- Indeks untuk tabel `asset_type_extrafields`
--
ALTER TABLE `asset_type_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_asset_type_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_datev` (`datev`),
  ADD KEY `idx_bank_dateo` (`dateo`),
  ADD KEY `idx_bank_fk_account` (`fk_account`),
  ADD KEY `idx_bank_rappro` (`rappro`),
  ADD KEY `idx_bank_num_releve` (`num_releve`);

--
-- Indeks untuk tabel `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  ADD KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`);

--
-- Indeks untuk tabel `bank_account_extrafields`
--
ALTER TABLE `bank_account_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bank_account_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `bank_categ`
--
ALTER TABLE `bank_categ`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `bank_class`
--
ALTER TABLE `bank_class`
  ADD UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`);

--
-- Indeks untuk tabel `bank_url`
--
ALTER TABLE `bank_url`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`);

--
-- Indeks untuk tabel `blockedlog`
--
ALTER TABLE `blockedlog`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`),
  ADD KEY `fk_object_element` (`fk_object`,`element`),
  ADD KEY `entity` (`entity`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `entity_action` (`entity`,`action`),
  ADD KEY `entity_action_certified` (`entity`,`action`,`certified`);

--
-- Indeks untuk tabel `blockedlog_authority`
--
ALTER TABLE `blockedlog_authority`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `signature` (`signature`);

--
-- Indeks untuk tabel `bom_bom`
--
ALTER TABLE `bom_bom`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  ADD KEY `idx_bom_bom_rowid` (`rowid`),
  ADD KEY `idx_bom_bom_ref` (`ref`),
  ADD KEY `bom_bom_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_bom_bom_status` (`status`),
  ADD KEY `idx_bom_bom_fk_product` (`fk_product`);

--
-- Indeks untuk tabel `bom_bomline`
--
ALTER TABLE `bom_bomline`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_bom_bomline_rowid` (`rowid`),
  ADD KEY `idx_bom_bomline_fk_product` (`fk_product`),
  ADD KEY `idx_bom_bomline_fk_bom` (`fk_bom`);

--
-- Indeks untuk tabel `bom_bomline_extrafields`
--
ALTER TABLE `bom_bomline_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `bom_bom_extrafields`
--
ALTER TABLE `bom_bom_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `bookmark`
--
ALTER TABLE `bookmark`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bookmark_url` (`fk_user`,`url`),
  ADD UNIQUE KEY `uk_bookmark_title` (`fk_user`,`title`);

--
-- Indeks untuk tabel `bordereau_cheque`
--
ALTER TABLE `bordereau_cheque`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`);

--
-- Indeks untuk tabel `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  ADD KEY `idx_boxes_boxid` (`box_id`),
  ADD KEY `idx_boxes_fk_user` (`fk_user`);

--
-- Indeks untuk tabel `boxes_def`
--
ALTER TABLE `boxes_def`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`);

--
-- Indeks untuk tabel `budget`
--
ALTER TABLE `budget`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `budget_lines`
--
ALTER TABLE `budget_lines`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`);

--
-- Indeks untuk tabel `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_categorie_ref` (`entity`,`fk_parent`,`label`,`type`),
  ADD KEY `idx_categorie_type` (`type`),
  ADD KEY `idx_categorie_label` (`label`);

--
-- Indeks untuk tabel `categories_extrafields`
--
ALTER TABLE `categories_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_categories_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `categorie_account`
--
ALTER TABLE `categorie_account`
  ADD PRIMARY KEY (`fk_categorie`,`fk_account`),
  ADD KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_account_fk_account` (`fk_account`);

--
-- Indeks untuk tabel `categorie_contact`
--
ALTER TABLE `categorie_contact`
  ADD PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  ADD KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`);

--
-- Indeks untuk tabel `categorie_fournisseur`
--
ALTER TABLE `categorie_fournisseur`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`);

--
-- Indeks untuk tabel `categorie_lang`
--
ALTER TABLE `categorie_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`);

--
-- Indeks untuk tabel `categorie_member`
--
ALTER TABLE `categorie_member`
  ADD PRIMARY KEY (`fk_categorie`,`fk_member`),
  ADD KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_member_fk_member` (`fk_member`);

--
-- Indeks untuk tabel `categorie_product`
--
ALTER TABLE `categorie_product`
  ADD PRIMARY KEY (`fk_categorie`,`fk_product`),
  ADD KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_product_fk_product` (`fk_product`);

--
-- Indeks untuk tabel `categorie_project`
--
ALTER TABLE `categorie_project`
  ADD PRIMARY KEY (`fk_categorie`,`fk_project`),
  ADD KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_project_fk_project` (`fk_project`);

--
-- Indeks untuk tabel `categorie_societe`
--
ALTER TABLE `categorie_societe`
  ADD PRIMARY KEY (`fk_categorie`,`fk_soc`),
  ADD KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_societe_fk_societe` (`fk_soc`);

--
-- Indeks untuk tabel `categorie_user`
--
ALTER TABLE `categorie_user`
  ADD PRIMARY KEY (`fk_categorie`,`fk_user`),
  ADD KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  ADD KEY `idx_categorie_user_fk_user` (`fk_user`);

--
-- Indeks untuk tabel `chargesociales`
--
ALTER TABLE `chargesociales`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  ADD KEY `idx_commande_fk_soc` (`fk_soc`),
  ADD KEY `idx_commande_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_commande_fk_projet` (`fk_projet`),
  ADD KEY `idx_commande_fk_account` (`fk_account`),
  ADD KEY `idx_commande_fk_currency` (`fk_currency`);

--
-- Indeks untuk tabel `commandedet`
--
ALTER TABLE `commandedet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_fk_commande` (`fk_commande`),
  ADD KEY `idx_commandedet_fk_product` (`fk_product`),
  ADD KEY `fk_commandedet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `commandedet_extrafields`
--
ALTER TABLE `commandedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commandedet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `commande_extrafields`
--
ALTER TABLE `commande_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `commande_fournisseur`
--
ALTER TABLE `commande_fournisseur`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  ADD KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  ADD KEY `billed` (`billed`);

--
-- Indeks untuk tabel `commande_fournisseurdet`
--
ALTER TABLE `commande_fournisseurdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `commande_fournisseurdet_extrafields`
--
ALTER TABLE `commande_fournisseurdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `commande_fournisseur_dispatch`
--
ALTER TABLE `commande_fournisseur_dispatch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  ADD KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`);

--
-- Indeks untuk tabel `commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `commande_fournisseur_dispatch_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `commande_fournisseur_extrafields`
--
ALTER TABLE `commande_fournisseur_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_commande_fournisseur_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `commande_fournisseur_log`
--
ALTER TABLE `commande_fournisseur_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `const`
--
ALTER TABLE `const`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_const` (`name`,`entity`);

--
-- Indeks untuk tabel `contrat`
--
ALTER TABLE `contrat`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  ADD KEY `idx_contrat_fk_soc` (`fk_soc`),
  ADD KEY `idx_contrat_fk_user_author` (`fk_user_author`);

--
-- Indeks untuk tabel `contratdet`
--
ALTER TABLE `contratdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  ADD KEY `idx_contratdet_fk_product` (`fk_product`),
  ADD KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  ADD KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  ADD KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  ADD KEY `fk_contratdet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `contratdet_extrafields`
--
ALTER TABLE `contratdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `contratdet_log`
--
ALTER TABLE `contratdet_log`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  ADD KEY `idx_contratdet_log_date` (`date`);

--
-- Indeks untuk tabel `contrat_extrafields`
--
ALTER TABLE `contrat_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_contrat_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `cronjob`
--
ALTER TABLE `cronjob`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_cronjob_status` (`status`),
  ADD KEY `idx_cronjob_datelastrun` (`datelastrun`),
  ADD KEY `idx_cronjob_datenextrun` (`datenextrun`),
  ADD KEY `idx_cronjob_datestart` (`datestart`),
  ADD KEY `idx_cronjob_dateend` (`dateend`);

--
-- Indeks untuk tabel `c_accounting_category`
--
ALTER TABLE `c_accounting_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`);

--
-- Indeks untuk tabel `c_actioncomm`
--
ALTER TABLE `c_actioncomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_actioncomm` (`code`);

--
-- Indeks untuk tabel `c_action_trigger`
--
ALTER TABLE `c_action_trigger`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_action_trigger_code` (`code`),
  ADD KEY `idx_action_trigger_rang` (`rang`);

--
-- Indeks untuk tabel `c_availability`
--
ALTER TABLE `c_availability`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_availability` (`code`);

--
-- Indeks untuk tabel `c_barcode_type`
--
ALTER TABLE `c_barcode_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`);

--
-- Indeks untuk tabel `c_chargesociales`
--
ALTER TABLE `c_chargesociales`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `c_civility`
--
ALTER TABLE `c_civility`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_civility` (`code`);

--
-- Indeks untuk tabel `c_country`
--
ALTER TABLE `c_country`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_c_country_code` (`code`),
  ADD UNIQUE KEY `idx_c_country_label` (`label`),
  ADD UNIQUE KEY `idx_c_country_code_iso` (`code_iso`);

--
-- Indeks untuk tabel `c_currencies`
--
ALTER TABLE `c_currencies`
  ADD PRIMARY KEY (`code_iso`),
  ADD UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`);

--
-- Indeks untuk tabel `c_departements`
--
ALTER TABLE `c_departements`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  ADD KEY `idx_departements_fk_region` (`fk_region`);

--
-- Indeks untuk tabel `c_ecotaxe`
--
ALTER TABLE `c_ecotaxe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_ecotaxe` (`code`);

--
-- Indeks untuk tabel `c_effectif`
--
ALTER TABLE `c_effectif`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_effectif` (`code`);

--
-- Indeks untuk tabel `c_email_senderprofile`
--
ALTER TABLE `c_email_senderprofile`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`);

--
-- Indeks untuk tabel `c_email_templates`
--
ALTER TABLE `c_email_templates`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  ADD KEY `idx_type` (`type_template`);

--
-- Indeks untuk tabel `c_exp_tax_cat`
--
ALTER TABLE `c_exp_tax_cat`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_exp_tax_range`
--
ALTER TABLE `c_exp_tax_range`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_field_list`
--
ALTER TABLE `c_field_list`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_format_cards`
--
ALTER TABLE `c_format_cards`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_forme_juridique`
--
ALTER TABLE `c_forme_juridique`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_forme_juridique` (`code`);

--
-- Indeks untuk tabel `c_holiday_types`
--
ALTER TABLE `c_holiday_types`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_holiday_types` (`code`);

--
-- Indeks untuk tabel `c_hrm_department`
--
ALTER TABLE `c_hrm_department`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_hrm_function`
--
ALTER TABLE `c_hrm_function`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_incoterms`
--
ALTER TABLE `c_incoterms`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_incoterms` (`code`);

--
-- Indeks untuk tabel `c_input_method`
--
ALTER TABLE `c_input_method`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_method` (`code`);

--
-- Indeks untuk tabel `c_input_reason`
--
ALTER TABLE `c_input_reason`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_input_reason` (`code`);

--
-- Indeks untuk tabel `c_lead_status`
--
ALTER TABLE `c_lead_status`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_lead_status_code` (`code`);

--
-- Indeks untuk tabel `c_paiement`
--
ALTER TABLE `c_paiement`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`);

--
-- Indeks untuk tabel `c_paper_format`
--
ALTER TABLE `c_paper_format`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_payment_term`
--
ALTER TABLE `c_payment_term`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`);

--
-- Indeks untuk tabel `c_price_expression`
--
ALTER TABLE `c_price_expression`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_price_global_variable`
--
ALTER TABLE `c_price_global_variable`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_price_global_variable_updater`
--
ALTER TABLE `c_price_global_variable_updater`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_propalst`
--
ALTER TABLE `c_propalst`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_propalst` (`code`);

--
-- Indeks untuk tabel `c_prospectlevel`
--
ALTER TABLE `c_prospectlevel`
  ADD PRIMARY KEY (`code`);

--
-- Indeks untuk tabel `c_regions`
--
ALTER TABLE `c_regions`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code_region` (`code_region`),
  ADD KEY `idx_c_regions_fk_pays` (`fk_pays`);

--
-- Indeks untuk tabel `c_revenuestamp`
--
ALTER TABLE `c_revenuestamp`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `c_shipment_mode`
--
ALTER TABLE `c_shipment_mode`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_shipment_mode` (`code`);

--
-- Indeks untuk tabel `c_stcomm`
--
ALTER TABLE `c_stcomm`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_stcomm` (`code`);

--
-- Indeks untuk tabel `c_ticket_category`
--
ALTER TABLE `c_ticket_category`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indeks untuk tabel `c_ticket_severity`
--
ALTER TABLE `c_ticket_severity`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indeks untuk tabel `c_ticket_type`
--
ALTER TABLE `c_ticket_type`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_code` (`code`,`entity`);

--
-- Indeks untuk tabel `c_tva`
--
ALTER TABLE `c_tva`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`);

--
-- Indeks untuk tabel `c_typent`
--
ALTER TABLE `c_typent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_typent` (`code`);

--
-- Indeks untuk tabel `c_type_contact`
--
ALTER TABLE `c_type_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`);

--
-- Indeks untuk tabel `c_type_container`
--
ALTER TABLE `c_type_container`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`);

--
-- Indeks untuk tabel `c_type_fees`
--
ALTER TABLE `c_type_fees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_c_type_fees` (`code`);

--
-- Indeks untuk tabel `c_type_resource`
--
ALTER TABLE `c_type_resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`);

--
-- Indeks untuk tabel `c_units`
--
ALTER TABLE `c_units`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_c_units_code` (`code`);

--
-- Indeks untuk tabel `c_ziptown`
--
ALTER TABLE `c_ziptown`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  ADD KEY `idx_c_ziptown_fk_county` (`fk_county`),
  ADD KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  ADD KEY `idx_c_ziptown_zip` (`zip`);

--
-- Indeks untuk tabel `default_values`
--
ALTER TABLE `default_values`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`);

--
-- Indeks untuk tabel `deplacement`
--
ALTER TABLE `deplacement`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `document_model`
--
ALTER TABLE `document_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`);

--
-- Indeks untuk tabel `don`
--
ALTER TABLE `don`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `don_extrafields`
--
ALTER TABLE `don_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_don_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `ecm_directories`
--
ALTER TABLE `ecm_directories`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  ADD KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  ADD KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`);

--
-- Indeks untuk tabel `ecm_files`
--
ALTER TABLE `ecm_files`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  ADD KEY `idx_ecm_files_label` (`label`);

--
-- Indeks untuk tabel `element_contact`
--
ALTER TABLE `element_contact`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  ADD KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  ADD KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`);

--
-- Indeks untuk tabel `element_element`
--
ALTER TABLE `element_element`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  ADD KEY `idx_element_element_fk_target` (`fk_target`);

--
-- Indeks untuk tabel `element_resources`
--
ALTER TABLE `element_resources`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  ADD KEY `idx_element_element_element_id` (`element_id`);

--
-- Indeks untuk tabel `emailcollector_emailcollector`
--
ALTER TABLE `emailcollector_emailcollector`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_emailcollector_entity` (`entity`),
  ADD KEY `idx_emailcollector_status` (`status`);

--
-- Indeks untuk tabel `emailcollector_emailcollectoraction`
--
ALTER TABLE `emailcollector_emailcollectoraction`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Indeks untuk tabel `emailcollector_emailcollectorfilter`
--
ALTER TABLE `emailcollector_emailcollectorfilter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  ADD KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`);

--
-- Indeks untuk tabel `entrepot`
--
ALTER TABLE `entrepot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`);

--
-- Indeks untuk tabel `establishment`
--
ALTER TABLE `establishment`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_events_dateevent` (`dateevent`);

--
-- Indeks untuk tabel `event_element`
--
ALTER TABLE `event_element`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `expedition`
--
ALTER TABLE `expedition`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expedition_fk_soc` (`fk_soc`),
  ADD KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`);

--
-- Indeks untuk tabel `expeditiondet`
--
ALTER TABLE `expeditiondet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`);

--
-- Indeks untuk tabel `expeditiondet_batch`
--
ALTER TABLE `expeditiondet_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fk_expeditiondet` (`fk_expeditiondet`);

--
-- Indeks untuk tabel `expeditiondet_extrafields`
--
ALTER TABLE `expeditiondet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expeditiondet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `expedition_extrafields`
--
ALTER TABLE `expedition_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expedition_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `expensereport`
--
ALTER TABLE `expensereport`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_expensereport_date_debut` (`date_debut`),
  ADD KEY `idx_expensereport_date_fin` (`date_fin`),
  ADD KEY `idx_expensereport_fk_statut` (`fk_statut`),
  ADD KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  ADD KEY `idx_expensereport_fk_refuse` (`fk_user_approve`);

--
-- Indeks untuk tabel `expensereport_det`
--
ALTER TABLE `expensereport_det`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `expensereport_extrafields`
--
ALTER TABLE `expensereport_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_expensereport_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `expensereport_ik`
--
ALTER TABLE `expensereport_ik`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `expensereport_rules`
--
ALTER TABLE `expensereport_rules`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `export_compta`
--
ALTER TABLE `export_compta`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `export_model`
--
ALTER TABLE `export_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_export_model` (`label`,`type`);

--
-- Indeks untuk tabel `extrafields`
--
ALTER TABLE `extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`);

--
-- Indeks untuk tabel `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  ADD KEY `idx_facture_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_facture_fk_projet` (`fk_projet`),
  ADD KEY `idx_facture_fk_account` (`fk_account`),
  ADD KEY `idx_facture_fk_currency` (`fk_currency`),
  ADD KEY `idx_facture_fk_statut` (`fk_statut`);

--
-- Indeks untuk tabel `facturedet`
--
ALTER TABLE `facturedet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  ADD KEY `idx_facturedet_fk_facture` (`fk_facture`),
  ADD KEY `idx_facturedet_fk_product` (`fk_product`),
  ADD KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facturedet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `facturedet_extrafields`
--
ALTER TABLE `facturedet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `facturedet_rec`
--
ALTER TABLE `facturedet_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `fk_facturedet_rec_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `facturedet_rec_extrafields`
--
ALTER TABLE `facturedet_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facturedet_rec_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `facture_extrafields`
--
ALTER TABLE `facture_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `facture_fourn`
--
ALTER TABLE `facture_fourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  ADD KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  ADD KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_facture_fourn_fk_projet` (`fk_projet`);

--
-- Indeks untuk tabel `facture_fourn_det`
--
ALTER TABLE `facture_fourn_det`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  ADD KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  ADD KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  ADD KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `facture_fourn_det_extrafields`
--
ALTER TABLE `facture_fourn_det_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_det_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `facture_fourn_extrafields`
--
ALTER TABLE `facture_fourn_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_fourn_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `facture_rec`
--
ALTER TABLE `facture_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_facture_rec_fk_projet` (`fk_projet`);

--
-- Indeks untuk tabel `facture_rec_extrafields`
--
ALTER TABLE `facture_rec_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_facture_rec_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `fichinter`
--
ALTER TABLE `fichinter`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  ADD KEY `idx_fichinter_fk_soc` (`fk_soc`);

--
-- Indeks untuk tabel `fichinterdet`
--
ALTER TABLE `fichinterdet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`);

--
-- Indeks untuk tabel `fichinterdet_extrafields`
--
ALTER TABLE `fichinterdet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinterdet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `fichinterdet_rec`
--
ALTER TABLE `fichinterdet_rec`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `fichinter_extrafields`
--
ALTER TABLE `fichinter_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ficheinter_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `fichinter_rec`
--
ALTER TABLE `fichinter_rec`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  ADD KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  ADD KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_fichinter_rec_fk_projet` (`fk_projet`);

--
-- Indeks untuk tabel `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_holiday_entity` (`entity`),
  ADD KEY `idx_holiday_fk_user` (`fk_user`),
  ADD KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  ADD KEY `idx_holiday_date_create` (`date_create`),
  ADD KEY `idx_holiday_date_debut` (`date_debut`),
  ADD KEY `idx_holiday_date_fin` (`date_fin`),
  ADD KEY `idx_holiday_fk_validator` (`fk_validator`);

--
-- Indeks untuk tabel `holiday_config`
--
ALTER TABLE `holiday_config`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_holiday_config` (`name`);

--
-- Indeks untuk tabel `holiday_logs`
--
ALTER TABLE `holiday_logs`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `holiday_users`
--
ALTER TABLE `holiday_users`
  ADD UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`,`nb_holiday`);

--
-- Indeks untuk tabel `import_model`
--
ALTER TABLE `import_model`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_import_model` (`label`,`type`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  ADD KEY `idx_inventory_tms` (`tms`),
  ADD KEY `idx_inventory_date_creation` (`date_creation`);

--
-- Indeks untuk tabel `inventorydet`
--
ALTER TABLE `inventorydet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_inventorydet_tms` (`tms`),
  ADD KEY `idx_inventorydet_datec` (`datec`),
  ADD KEY `idx_inventorydet_fk_inventory` (`fk_inventory`);

--
-- Indeks untuk tabel `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_links` (`objectid`,`label`);

--
-- Indeks untuk tabel `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_livraison_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_livraison_fk_soc` (`fk_soc`),
  ADD KEY `idx_livraison_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_livraison_fk_user_valid` (`fk_user_valid`);

--
-- Indeks untuk tabel `livraisondet`
--
ALTER TABLE `livraisondet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_livraisondet_fk_expedition` (`fk_livraison`);

--
-- Indeks untuk tabel `livraisondet_extrafields`
--
ALTER TABLE `livraisondet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_livraisondet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `livraison_extrafields`
--
ALTER TABLE `livraison_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_livraison_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `loan_schedule`
--
ALTER TABLE `loan_schedule`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `localtax`
--
ALTER TABLE `localtax`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `mailing`
--
ALTER TABLE `mailing`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `mailing_cibles`
--
ALTER TABLE `mailing_cibles`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  ADD KEY `idx_mailing_cibles_email` (`email`);

--
-- Indeks untuk tabel `mailing_unsubscribe`
--
ALTER TABLE `mailing_unsubscribe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  ADD KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`);

--
-- Indeks untuk tabel `multicurrency`
--
ALTER TABLE `multicurrency`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `multicurrency_rate`
--
ALTER TABLE `multicurrency_rate`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `notify`
--
ALTER TABLE `notify`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `notify_def`
--
ALTER TABLE `notify_def`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `notify_def_object`
--
ALTER TABLE `notify_def_object`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth_state`
--
ALTER TABLE `oauth_state`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `oauth_token`
--
ALTER TABLE `oauth_token`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `onlinesignature`
--
ALTER TABLE `onlinesignature`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `opensurvey_comments`
--
ALTER TABLE `opensurvey_comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `idx_id_comment` (`id_comment`),
  ADD KEY `idx_id_sondage` (`id_sondage`);

--
-- Indeks untuk tabel `opensurvey_formquestions`
--
ALTER TABLE `opensurvey_formquestions`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `opensurvey_sondage`
--
ALTER TABLE `opensurvey_sondage`
  ADD PRIMARY KEY (`id_sondage`),
  ADD KEY `idx_date_fin` (`date_fin`);

--
-- Indeks untuk tabel `opensurvey_user_studs`
--
ALTER TABLE `opensurvey_user_studs`
  ADD PRIMARY KEY (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  ADD KEY `idx_opensurvey_user_studs_nom` (`nom`),
  ADD KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`);

--
-- Indeks untuk tabel `overwrite_trans`
--
ALTER TABLE `overwrite_trans`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_overwrite_trans` (`lang`,`transkey`);

--
-- Indeks untuk tabel `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `paiementcharge`
--
ALTER TABLE `paiementcharge`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `paiementfourn`
--
ALTER TABLE `paiementfourn`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `paiementfourn_facturefourn`
--
ALTER TABLE `paiementfourn_facturefourn`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  ADD KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`);

--
-- Indeks untuk tabel `paiement_facture`
--
ALTER TABLE `paiement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  ADD KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`);

--
-- Indeks untuk tabel `payment_donation`
--
ALTER TABLE `payment_donation`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `payment_expensereport`
--
ALTER TABLE `payment_expensereport`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `payment_loan`
--
ALTER TABLE `payment_loan`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `payment_salary`
--
ALTER TABLE `payment_salary`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_payment_salary_ref` (`num_payment`),
  ADD KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  ADD KEY `idx_payment_salary_datep` (`datep`),
  ADD KEY `idx_payment_salary_datesp` (`datesp`),
  ADD KEY `idx_payment_salary_dateep` (`dateep`);

--
-- Indeks untuk tabel `payment_various`
--
ALTER TABLE `payment_various`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `pos_cash_fence`
--
ALTER TABLE `pos_cash_fence`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `prelevement_bons`
--
ALTER TABLE `prelevement_bons`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`);

--
-- Indeks untuk tabel `prelevement_facture`
--
ALTER TABLE `prelevement_facture`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`);

--
-- Indeks untuk tabel `prelevement_facture_demande`
--
ALTER TABLE `prelevement_facture_demande`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `prelevement_lignes`
--
ALTER TABLE `prelevement_lignes`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`);

--
-- Indeks untuk tabel `prelevement_rejet`
--
ALTER TABLE `prelevement_rejet`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `printing`
--
ALTER TABLE `printing`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_label` (`label`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_import_key` (`import_key`),
  ADD KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  ADD KEY `idx_product_fk_country` (`fk_country`),
  ADD KEY `idx_product_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  ADD KEY `idx_product_fk_project` (`fk_project`),
  ADD KEY `fk_product_fk_unit` (`fk_unit`),
  ADD KEY `fk_product_default_warehouse` (`fk_default_warehouse`);

--
-- Indeks untuk tabel `product_association`
--
ALTER TABLE `product_association`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  ADD KEY `idx_product_association_fils` (`fk_product_fils`);

--
-- Indeks untuk tabel `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_ref` (`ref`);

--
-- Indeks untuk tabel `product_attribute_combination`
--
ALTER TABLE `product_attribute_combination`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  ADD KEY `idx_product_att_com_product_child` (`fk_product_child`);

--
-- Indeks untuk tabel `product_attribute_combination2val`
--
ALTER TABLE `product_attribute_combination2val`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `product_attribute_value`
--
ALTER TABLE `product_attribute_value`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`);

--
-- Indeks untuk tabel `product_batch`
--
ALTER TABLE `product_batch`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  ADD KEY `idx_fk_product_stock` (`fk_product_stock`),
  ADD KEY `idx_batch` (`batch`);

--
-- Indeks untuk tabel `product_customer_price`
--
ALTER TABLE `product_customer_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  ADD KEY `idx_product_customer_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_customer_price_fk_soc` (`fk_soc`);

--
-- Indeks untuk tabel `product_customer_price_log`
--
ALTER TABLE `product_customer_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `product_extrafields`
--
ALTER TABLE `product_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `product_fournisseur_price`
--
ALTER TABLE `product_fournisseur_price`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  ADD UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  ADD KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  ADD KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  ADD KEY `idx_product_barcode` (`barcode`),
  ADD KEY `idx_product_fk_barcode_type` (`fk_barcode_type`);

--
-- Indeks untuk tabel `product_fournisseur_price_log`
--
ALTER TABLE `product_fournisseur_price_log`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `product_lang`
--
ALTER TABLE `product_lang`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`);

--
-- Indeks untuk tabel `product_lot`
--
ALTER TABLE `product_lot`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`);

--
-- Indeks untuk tabel `product_lot_extrafields`
--
ALTER TABLE `product_lot_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_lot_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_product_price_fk_product` (`fk_product`);

--
-- Indeks untuk tabel `product_pricerules`
--
ALTER TABLE `product_pricerules`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `unique_level` (`level`);

--
-- Indeks untuk tabel `product_price_by_qty`
--
ALTER TABLE `product_price_by_qty`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  ADD KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`);

--
-- Indeks untuk tabel `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  ADD KEY `idx_product_stock_fk_product` (`fk_product`),
  ADD KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`);

--
-- Indeks untuk tabel `product_warehouse_properties`
--
ALTER TABLE `product_warehouse_properties`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_fk_soc` (`fk_soc`);

--
-- Indeks untuk tabel `projet_extrafields`
--
ALTER TABLE `projet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `projet_task`
--
ALTER TABLE `projet_task`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  ADD KEY `idx_projet_task_fk_projet` (`fk_projet`),
  ADD KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  ADD KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`);

--
-- Indeks untuk tabel `projet_task_extrafields`
--
ALTER TABLE `projet_task_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `projet_task_time`
--
ALTER TABLE `projet_task_time`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_projet_task_time_task` (`fk_task`),
  ADD KEY `idx_projet_task_time_date` (`task_date`),
  ADD KEY `idx_projet_task_time_datehour` (`task_datehour`);

--
-- Indeks untuk tabel `propal`
--
ALTER TABLE `propal`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  ADD KEY `idx_propal_fk_soc` (`fk_soc`),
  ADD KEY `idx_propal_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  ADD KEY `idx_propal_fk_projet` (`fk_projet`),
  ADD KEY `idx_propal_fk_account` (`fk_account`),
  ADD KEY `idx_propal_fk_currency` (`fk_currency`);

--
-- Indeks untuk tabel `propaldet`
--
ALTER TABLE `propaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_fk_propal` (`fk_propal`),
  ADD KEY `idx_propaldet_fk_product` (`fk_product`),
  ADD KEY `fk_propaldet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `propaldet_extrafields`
--
ALTER TABLE `propaldet_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propaldet_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `propal_extrafields`
--
ALTER TABLE `propal_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_propal_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `propal_merge_pdf_product`
--
ALTER TABLE `propal_merge_pdf_product`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `reception`
--
ALTER TABLE `reception`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  ADD KEY `idx_reception_fk_soc` (`fk_soc`),
  ADD KEY `idx_reception_fk_user_author` (`fk_user_author`),
  ADD KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  ADD KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`);

--
-- Indeks untuk tabel `reception_extrafields`
--
ALTER TABLE `reception_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_reception_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  ADD KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  ADD KEY `idx_resource_fk_country` (`fk_country`);

--
-- Indeks untuk tabel `resource_extrafields`
--
ALTER TABLE `resource_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_resource_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `rights_def`
--
ALTER TABLE `rights_def`
  ADD PRIMARY KEY (`id`,`entity`);

--
-- Indeks untuk tabel `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  ADD UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  ADD UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  ADD KEY `idx_societe_user_creat` (`fk_user_creat`),
  ADD KEY `idx_societe_user_modif` (`fk_user_modif`);

--
-- Indeks untuk tabel `societe_account`
--
ALTER TABLE `societe_account`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  ADD UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  ADD KEY `idx_societe_account_rowid` (`rowid`),
  ADD KEY `idx_societe_account_login` (`login`),
  ADD KEY `idx_societe_account_status` (`status`),
  ADD KEY `idx_societe_account_fk_website` (`fk_website`),
  ADD KEY `idx_societe_account_fk_soc` (`fk_soc`);

--
-- Indeks untuk tabel `societe_address`
--
ALTER TABLE `societe_address`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `societe_commerciaux`
--
ALTER TABLE `societe_commerciaux`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`);

--
-- Indeks untuk tabel `societe_extrafields`
--
ALTER TABLE `societe_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `societe_log`
--
ALTER TABLE `societe_log`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `societe_prices`
--
ALTER TABLE `societe_prices`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `societe_remise`
--
ALTER TABLE `societe_remise`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `societe_remise_except`
--
ALTER TABLE `societe_remise_except`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  ADD KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  ADD KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  ADD KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  ADD KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  ADD KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  ADD KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  ADD KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`);

--
-- Indeks untuk tabel `societe_remise_supplier`
--
ALTER TABLE `societe_remise_supplier`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `societe_rib`
--
ALTER TABLE `societe_rib`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`);

--
-- Indeks untuk tabel `socpeople`
--
ALTER TABLE `socpeople`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_fk_soc` (`fk_soc`),
  ADD KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`);

--
-- Indeks untuk tabel `socpeople_extrafields`
--
ALTER TABLE `socpeople_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_socpeople_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `stock_mouvement`
--
ALTER TABLE `stock_mouvement`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  ADD KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`);

--
-- Indeks untuk tabel `subscription`
--
ALTER TABLE `subscription`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`);

--
-- Indeks untuk tabel `supplier_proposal`
--
ALTER TABLE `supplier_proposal`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `supplier_proposaldet`
--
ALTER TABLE `supplier_proposaldet`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  ADD KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  ADD KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`);

--
-- Indeks untuk tabel `supplier_proposaldet_extrafields`
--
ALTER TABLE `supplier_proposaldet_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `supplier_proposal_extrafields`
--
ALTER TABLE `supplier_proposal_extrafields`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `takepos_floor_tables`
--
ALTER TABLE `takepos_floor_tables`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_ticket_track_id` (`track_id`);

--
-- Indeks untuk tabel `ticket_extrafields`
--
ALTER TABLE `ticket_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_ticket_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `tva`
--
ALTER TABLE `tva`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_login` (`login`,`entity`),
  ADD UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  ADD UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  ADD UNIQUE KEY `uk_user_api_key` (`api_key`),
  ADD KEY `idx_user_fk_societe` (`fk_soc`);

--
-- Indeks untuk tabel `usergroup`
--
ALTER TABLE `usergroup`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`);

--
-- Indeks untuk tabel `usergroup_extrafields`
--
ALTER TABLE `usergroup_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_usergroup_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `usergroup_rights`
--
ALTER TABLE `usergroup_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  ADD KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`);

--
-- Indeks untuk tabel `usergroup_user`
--
ALTER TABLE `usergroup_user`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  ADD KEY `fk_usergroup_user_fk_user` (`fk_user`),
  ADD KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`);

--
-- Indeks untuk tabel `user_alert`
--
ALTER TABLE `user_alert`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `user_clicktodial`
--
ALTER TABLE `user_clicktodial`
  ADD PRIMARY KEY (`fk_user`);

--
-- Indeks untuk tabel `user_employment`
--
ALTER TABLE `user_employment`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  ADD KEY `fk_user_employment_fk_user` (`fk_user`);

--
-- Indeks untuk tabel `user_extrafields`
--
ALTER TABLE `user_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_user_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `user_param`
--
ALTER TABLE `user_param`
  ADD UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`);

--
-- Indeks untuk tabel `user_rib`
--
ALTER TABLE `user_rib`
  ADD PRIMARY KEY (`rowid`);

--
-- Indeks untuk tabel `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  ADD KEY `fk_user_rights_fk_user_user` (`fk_user`);

--
-- Indeks untuk tabel `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_ref` (`ref`,`entity`);

--
-- Indeks untuk tabel `website_extrafields`
--
ALTER TABLE `website_extrafields`
  ADD PRIMARY KEY (`rowid`),
  ADD KEY `idx_website_extrafields` (`fk_object`);

--
-- Indeks untuk tabel `website_page`
--
ALTER TABLE `website_page`
  ADD PRIMARY KEY (`rowid`),
  ADD UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `accounting_account`
--
ALTER TABLE `accounting_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `accounting_bookkeeping`
--
ALTER TABLE `accounting_bookkeeping`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `accounting_bookkeeping_tmp`
--
ALTER TABLE `accounting_bookkeeping_tmp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `accounting_fiscalyear`
--
ALTER TABLE `accounting_fiscalyear`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `accounting_journal`
--
ALTER TABLE `accounting_journal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `accounting_system`
--
ALTER TABLE `accounting_system`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `actioncomm`
--
ALTER TABLE `actioncomm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `actioncomm_extrafields`
--
ALTER TABLE `actioncomm_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `actioncomm_reminder`
--
ALTER TABLE `actioncomm_reminder`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `actioncomm_resources`
--
ALTER TABLE `actioncomm_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `adherent`
--
ALTER TABLE `adherent`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `adherent_extrafields`
--
ALTER TABLE `adherent_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `adherent_type`
--
ALTER TABLE `adherent_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `adherent_type_extrafields`
--
ALTER TABLE `adherent_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `advtargetemailing`
--
ALTER TABLE `advtargetemailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `asset`
--
ALTER TABLE `asset`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `asset_extrafields`
--
ALTER TABLE `asset_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `asset_type`
--
ALTER TABLE `asset_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `asset_type_extrafields`
--
ALTER TABLE `asset_type_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank`
--
ALTER TABLE `bank`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_account_extrafields`
--
ALTER TABLE `bank_account_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_categ`
--
ALTER TABLE `bank_categ`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bank_url`
--
ALTER TABLE `bank_url`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blockedlog`
--
ALTER TABLE `blockedlog`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `blockedlog_authority`
--
ALTER TABLE `blockedlog_authority`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bom_bom`
--
ALTER TABLE `bom_bom`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bom_bomline`
--
ALTER TABLE `bom_bomline`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bom_bomline_extrafields`
--
ALTER TABLE `bom_bomline_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bom_bom_extrafields`
--
ALTER TABLE `bom_bom_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bookmark`
--
ALTER TABLE `bookmark`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `bordereau_cheque`
--
ALTER TABLE `bordereau_cheque`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `boxes`
--
ALTER TABLE `boxes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `boxes_def`
--
ALTER TABLE `boxes_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `budget`
--
ALTER TABLE `budget`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `budget_lines`
--
ALTER TABLE `budget_lines`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categorie`
--
ALTER TABLE `categorie`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categories_extrafields`
--
ALTER TABLE `categories_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `categorie_lang`
--
ALTER TABLE `categorie_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chargesociales`
--
ALTER TABLE `chargesociales`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande`
--
ALTER TABLE `commande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commandedet`
--
ALTER TABLE `commandedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commandedet_extrafields`
--
ALTER TABLE `commandedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_extrafields`
--
ALTER TABLE `commande_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseur`
--
ALTER TABLE `commande_fournisseur`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseurdet`
--
ALTER TABLE `commande_fournisseurdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseurdet_extrafields`
--
ALTER TABLE `commande_fournisseurdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseur_dispatch`
--
ALTER TABLE `commande_fournisseur_dispatch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseur_dispatch_extrafields`
--
ALTER TABLE `commande_fournisseur_dispatch_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseur_extrafields`
--
ALTER TABLE `commande_fournisseur_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `commande_fournisseur_log`
--
ALTER TABLE `commande_fournisseur_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `const`
--
ALTER TABLE `const`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contrat`
--
ALTER TABLE `contrat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contratdet`
--
ALTER TABLE `contratdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contratdet_extrafields`
--
ALTER TABLE `contratdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contratdet_log`
--
ALTER TABLE `contratdet_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `contrat_extrafields`
--
ALTER TABLE `contrat_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cronjob`
--
ALTER TABLE `cronjob`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_accounting_category`
--
ALTER TABLE `c_accounting_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_action_trigger`
--
ALTER TABLE `c_action_trigger`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_availability`
--
ALTER TABLE `c_availability`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_barcode_type`
--
ALTER TABLE `c_barcode_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_chargesociales`
--
ALTER TABLE `c_chargesociales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_departements`
--
ALTER TABLE `c_departements`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_ecotaxe`
--
ALTER TABLE `c_ecotaxe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_email_senderprofile`
--
ALTER TABLE `c_email_senderprofile`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_email_templates`
--
ALTER TABLE `c_email_templates`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_exp_tax_cat`
--
ALTER TABLE `c_exp_tax_cat`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_exp_tax_range`
--
ALTER TABLE `c_exp_tax_range`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_field_list`
--
ALTER TABLE `c_field_list`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_format_cards`
--
ALTER TABLE `c_format_cards`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_forme_juridique`
--
ALTER TABLE `c_forme_juridique`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_holiday_types`
--
ALTER TABLE `c_holiday_types`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_incoterms`
--
ALTER TABLE `c_incoterms`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_input_method`
--
ALTER TABLE `c_input_method`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_input_reason`
--
ALTER TABLE `c_input_reason`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_lead_status`
--
ALTER TABLE `c_lead_status`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_paiement`
--
ALTER TABLE `c_paiement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_paper_format`
--
ALTER TABLE `c_paper_format`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_payment_term`
--
ALTER TABLE `c_payment_term`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_price_expression`
--
ALTER TABLE `c_price_expression`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_price_global_variable`
--
ALTER TABLE `c_price_global_variable`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_price_global_variable_updater`
--
ALTER TABLE `c_price_global_variable_updater`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_regions`
--
ALTER TABLE `c_regions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_revenuestamp`
--
ALTER TABLE `c_revenuestamp`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_shipment_mode`
--
ALTER TABLE `c_shipment_mode`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_ticket_category`
--
ALTER TABLE `c_ticket_category`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_ticket_severity`
--
ALTER TABLE `c_ticket_severity`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_ticket_type`
--
ALTER TABLE `c_ticket_type`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_tva`
--
ALTER TABLE `c_tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_type_container`
--
ALTER TABLE `c_type_container`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_type_fees`
--
ALTER TABLE `c_type_fees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_type_resource`
--
ALTER TABLE `c_type_resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_units`
--
ALTER TABLE `c_units`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `c_ziptown`
--
ALTER TABLE `c_ziptown`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `default_values`
--
ALTER TABLE `default_values`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `deplacement`
--
ALTER TABLE `deplacement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `document_model`
--
ALTER TABLE `document_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `don`
--
ALTER TABLE `don`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `don_extrafields`
--
ALTER TABLE `don_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ecm_directories`
--
ALTER TABLE `ecm_directories`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ecm_files`
--
ALTER TABLE `ecm_files`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `element_contact`
--
ALTER TABLE `element_contact`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `element_element`
--
ALTER TABLE `element_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `element_resources`
--
ALTER TABLE `element_resources`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `emailcollector_emailcollector`
--
ALTER TABLE `emailcollector_emailcollector`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `emailcollector_emailcollectoraction`
--
ALTER TABLE `emailcollector_emailcollectoraction`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `emailcollector_emailcollectorfilter`
--
ALTER TABLE `emailcollector_emailcollectorfilter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `entrepot`
--
ALTER TABLE `entrepot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `establishment`
--
ALTER TABLE `establishment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `events`
--
ALTER TABLE `events`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `event_element`
--
ALTER TABLE `event_element`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expedition`
--
ALTER TABLE `expedition`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expeditiondet`
--
ALTER TABLE `expeditiondet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expeditiondet_batch`
--
ALTER TABLE `expeditiondet_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expeditiondet_extrafields`
--
ALTER TABLE `expeditiondet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expedition_extrafields`
--
ALTER TABLE `expedition_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expensereport`
--
ALTER TABLE `expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expensereport_det`
--
ALTER TABLE `expensereport_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expensereport_extrafields`
--
ALTER TABLE `expensereport_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expensereport_ik`
--
ALTER TABLE `expensereport_ik`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `expensereport_rules`
--
ALTER TABLE `expensereport_rules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `export_compta`
--
ALTER TABLE `export_compta`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `export_model`
--
ALTER TABLE `export_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `extrafields`
--
ALTER TABLE `extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture`
--
ALTER TABLE `facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facturedet`
--
ALTER TABLE `facturedet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facturedet_extrafields`
--
ALTER TABLE `facturedet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facturedet_rec`
--
ALTER TABLE `facturedet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facturedet_rec_extrafields`
--
ALTER TABLE `facturedet_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_extrafields`
--
ALTER TABLE `facture_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_fourn`
--
ALTER TABLE `facture_fourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_fourn_det`
--
ALTER TABLE `facture_fourn_det`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_fourn_det_extrafields`
--
ALTER TABLE `facture_fourn_det_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_fourn_extrafields`
--
ALTER TABLE `facture_fourn_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_rec`
--
ALTER TABLE `facture_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `facture_rec_extrafields`
--
ALTER TABLE `facture_rec_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinter`
--
ALTER TABLE `fichinter`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinterdet`
--
ALTER TABLE `fichinterdet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinterdet_extrafields`
--
ALTER TABLE `fichinterdet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinterdet_rec`
--
ALTER TABLE `fichinterdet_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinter_extrafields`
--
ALTER TABLE `fichinter_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `fichinter_rec`
--
ALTER TABLE `fichinter_rec`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `holiday`
--
ALTER TABLE `holiday`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `holiday_config`
--
ALTER TABLE `holiday_config`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `holiday_logs`
--
ALTER TABLE `holiday_logs`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `import_model`
--
ALTER TABLE `import_model`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inventory`
--
ALTER TABLE `inventory`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `inventorydet`
--
ALTER TABLE `inventorydet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `links`
--
ALTER TABLE `links`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `livraison`
--
ALTER TABLE `livraison`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `livraisondet`
--
ALTER TABLE `livraisondet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `livraisondet_extrafields`
--
ALTER TABLE `livraisondet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `livraison_extrafields`
--
ALTER TABLE `livraison_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loan`
--
ALTER TABLE `loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `loan_schedule`
--
ALTER TABLE `loan_schedule`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `localtax`
--
ALTER TABLE `localtax`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mailing`
--
ALTER TABLE `mailing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mailing_cibles`
--
ALTER TABLE `mailing_cibles`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `mailing_unsubscribe`
--
ALTER TABLE `mailing_unsubscribe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `multicurrency`
--
ALTER TABLE `multicurrency`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `multicurrency_rate`
--
ALTER TABLE `multicurrency_rate`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notify`
--
ALTER TABLE `notify`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notify_def`
--
ALTER TABLE `notify_def`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notify_def_object`
--
ALTER TABLE `notify_def_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oauth_state`
--
ALTER TABLE `oauth_state`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `oauth_token`
--
ALTER TABLE `oauth_token`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `onlinesignature`
--
ALTER TABLE `onlinesignature`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opensurvey_comments`
--
ALTER TABLE `opensurvey_comments`
  MODIFY `id_comment` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opensurvey_formquestions`
--
ALTER TABLE `opensurvey_formquestions`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `opensurvey_user_studs`
--
ALTER TABLE `opensurvey_user_studs`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `overwrite_trans`
--
ALTER TABLE `overwrite_trans`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paiement`
--
ALTER TABLE `paiement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paiementcharge`
--
ALTER TABLE `paiementcharge`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paiementfourn`
--
ALTER TABLE `paiementfourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paiementfourn_facturefourn`
--
ALTER TABLE `paiementfourn_facturefourn`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `paiement_facture`
--
ALTER TABLE `paiement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_donation`
--
ALTER TABLE `payment_donation`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_expensereport`
--
ALTER TABLE `payment_expensereport`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_loan`
--
ALTER TABLE `payment_loan`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_salary`
--
ALTER TABLE `payment_salary`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payment_various`
--
ALTER TABLE `payment_various`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pos_cash_fence`
--
ALTER TABLE `pos_cash_fence`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prelevement_bons`
--
ALTER TABLE `prelevement_bons`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prelevement_facture`
--
ALTER TABLE `prelevement_facture`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prelevement_facture_demande`
--
ALTER TABLE `prelevement_facture_demande`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prelevement_lignes`
--
ALTER TABLE `prelevement_lignes`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `prelevement_rejet`
--
ALTER TABLE `prelevement_rejet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `printing`
--
ALTER TABLE `printing`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product`
--
ALTER TABLE `product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_association`
--
ALTER TABLE `product_association`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_attribute_combination`
--
ALTER TABLE `product_attribute_combination`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_attribute_combination2val`
--
ALTER TABLE `product_attribute_combination2val`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_attribute_value`
--
ALTER TABLE `product_attribute_value`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_batch`
--
ALTER TABLE `product_batch`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_customer_price`
--
ALTER TABLE `product_customer_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_customer_price_log`
--
ALTER TABLE `product_customer_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_extrafields`
--
ALTER TABLE `product_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_fournisseur_price`
--
ALTER TABLE `product_fournisseur_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_fournisseur_price_log`
--
ALTER TABLE `product_fournisseur_price_log`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_lang`
--
ALTER TABLE `product_lang`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_lot`
--
ALTER TABLE `product_lot`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_lot_extrafields`
--
ALTER TABLE `product_lot_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_price`
--
ALTER TABLE `product_price`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_pricerules`
--
ALTER TABLE `product_pricerules`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_price_by_qty`
--
ALTER TABLE `product_price_by_qty`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `product_warehouse_properties`
--
ALTER TABLE `product_warehouse_properties`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `projet`
--
ALTER TABLE `projet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `projet_extrafields`
--
ALTER TABLE `projet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `projet_task`
--
ALTER TABLE `projet_task`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `projet_task_extrafields`
--
ALTER TABLE `projet_task_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `projet_task_time`
--
ALTER TABLE `projet_task_time`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `propal`
--
ALTER TABLE `propal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `propaldet`
--
ALTER TABLE `propaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `propaldet_extrafields`
--
ALTER TABLE `propaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `propal_extrafields`
--
ALTER TABLE `propal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `propal_merge_pdf_product`
--
ALTER TABLE `propal_merge_pdf_product`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reception`
--
ALTER TABLE `reception`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `reception_extrafields`
--
ALTER TABLE `reception_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resource`
--
ALTER TABLE `resource`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `resource_extrafields`
--
ALTER TABLE `resource_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe`
--
ALTER TABLE `societe`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_account`
--
ALTER TABLE `societe_account`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_address`
--
ALTER TABLE `societe_address`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_commerciaux`
--
ALTER TABLE `societe_commerciaux`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_extrafields`
--
ALTER TABLE `societe_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_log`
--
ALTER TABLE `societe_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_prices`
--
ALTER TABLE `societe_prices`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_remise`
--
ALTER TABLE `societe_remise`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_remise_except`
--
ALTER TABLE `societe_remise_except`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_remise_supplier`
--
ALTER TABLE `societe_remise_supplier`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `societe_rib`
--
ALTER TABLE `societe_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `socpeople`
--
ALTER TABLE `socpeople`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `socpeople_extrafields`
--
ALTER TABLE `socpeople_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stock_mouvement`
--
ALTER TABLE `stock_mouvement`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `subscription`
--
ALTER TABLE `subscription`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier_proposal`
--
ALTER TABLE `supplier_proposal`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier_proposaldet`
--
ALTER TABLE `supplier_proposaldet`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier_proposaldet_extrafields`
--
ALTER TABLE `supplier_proposaldet_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `supplier_proposal_extrafields`
--
ALTER TABLE `supplier_proposal_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `takepos_floor_tables`
--
ALTER TABLE `takepos_floor_tables`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ticket`
--
ALTER TABLE `ticket`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `ticket_extrafields`
--
ALTER TABLE `ticket_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tva`
--
ALTER TABLE `tva`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `usergroup`
--
ALTER TABLE `usergroup`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `usergroup_extrafields`
--
ALTER TABLE `usergroup_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `usergroup_rights`
--
ALTER TABLE `usergroup_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `usergroup_user`
--
ALTER TABLE `usergroup_user`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_alert`
--
ALTER TABLE `user_alert`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_employment`
--
ALTER TABLE `user_employment`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_extrafields`
--
ALTER TABLE `user_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_rib`
--
ALTER TABLE `user_rib`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `website`
--
ALTER TABLE `website`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `website_extrafields`
--
ALTER TABLE `website_extrafields`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `website_page`
--
ALTER TABLE `website_page`
  MODIFY `rowid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `accounting_account`
--
ALTER TABLE `accounting_account`
  ADD CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `accounting_system` (`pcg_version`);

--
-- Ketidakleluasaan untuk tabel `adherent`
--
ALTER TABLE `adherent`
  ADD CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `adherent_type` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`fk_asset_type`) REFERENCES `asset_type` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `bank_account`
--
ALTER TABLE `bank_account`
  ADD CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `accounting_journal` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `bom_bom`
--
ALTER TABLE `bom_bom`
  ADD CONSTRAINT `bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `bom_bomline`
--
ALTER TABLE `bom_bomline`
  ADD CONSTRAINT `bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `bom_bom` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `boxes`
--
ALTER TABLE `boxes`
  ADD CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `boxes_def` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `budget_lines`
--
ALTER TABLE `budget_lines`
  ADD CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `budget` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_account`
--
ALTER TABLE `categorie_account`
  ADD CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `bank_account` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_contact`
--
ALTER TABLE `categorie_contact`
  ADD CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `socpeople` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_fournisseur`
--
ALTER TABLE `categorie_fournisseur`
  ADD CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_lang`
--
ALTER TABLE `categorie_lang`
  ADD CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `categorie` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_member`
--
ALTER TABLE `categorie_member`
  ADD CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `adherent` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_product`
--
ALTER TABLE `categorie_product`
  ADD CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_project`
--
ALTER TABLE `categorie_project`
  ADD CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `projet` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_societe`
--
ALTER TABLE `categorie_societe`
  ADD CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `categorie_user`
--
ALTER TABLE `categorie_user`
  ADD CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `categorie` (`rowid`),
  ADD CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `commandedet`
--
ALTER TABLE `commandedet`
  ADD CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `commande` (`rowid`),
  ADD CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `commande_fournisseur`
--
ALTER TABLE `commande_fournisseur`
  ADD CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `commande_fournisseurdet`
--
ALTER TABLE `commande_fournisseurdet`
  ADD CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `commande_fournisseur_dispatch`
--
ALTER TABLE `commande_fournisseur_dispatch`
  ADD CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `reception` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `contrat`
--
ALTER TABLE `contrat`
  ADD CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `contratdet`
--
ALTER TABLE `contratdet`
  ADD CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `contrat` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`),
  ADD CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `contratdet_log`
--
ALTER TABLE `contratdet_log`
  ADD CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `contratdet` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `c_departements`
--
ALTER TABLE `c_departements`
  ADD CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `c_regions` (`code_region`);

--
-- Ketidakleluasaan untuk tabel `c_regions`
--
ALTER TABLE `c_regions`
  ADD CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `c_country` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `c_ziptown`
--
ALTER TABLE `c_ziptown`
  ADD CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `c_departements` (`rowid`),
  ADD CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `c_country` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `ecm_directories`
--
ALTER TABLE `ecm_directories`
  ADD CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `element_contact`
--
ALTER TABLE `element_contact`
  ADD CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `c_type_contact` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `emailcollector_emailcollectoraction`
--
ALTER TABLE `emailcollector_emailcollectoraction`
  ADD CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `emailcollector_emailcollector` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `emailcollector_emailcollectorfilter`
--
ALTER TABLE `emailcollector_emailcollectorfilter`
  ADD CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `emailcollector_emailcollector` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `expedition`
--
ALTER TABLE `expedition`
  ADD CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `expeditiondet`
--
ALTER TABLE `expeditiondet`
  ADD CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `expedition` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `expeditiondet_batch`
--
ALTER TABLE `expeditiondet_batch`
  ADD CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `expeditiondet` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `facture` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facturedet`
--
ALTER TABLE `facturedet`
  ADD CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `facture` (`rowid`),
  ADD CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facturedet_rec`
--
ALTER TABLE `facturedet_rec`
  ADD CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facture_fourn`
--
ALTER TABLE `facture_fourn`
  ADD CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facture_fourn_det`
--
ALTER TABLE `facture_fourn_det`
  ADD CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `facture_rec`
--
ALTER TABLE `facture_rec`
  ADD CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `fichinter`
--
ALTER TABLE `fichinter`
  ADD CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `fichinterdet`
--
ALTER TABLE `fichinterdet`
  ADD CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `fichinter` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `fichinter_rec`
--
ALTER TABLE `fichinter_rec`
  ADD CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `fk_livraison_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_livraison_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_livraison_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `livraisondet`
--
ALTER TABLE `livraisondet`
  ADD CONSTRAINT `fk_livraisondet_fk_livraison` FOREIGN KEY (`fk_livraison`) REFERENCES `livraison` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `paiement_facture`
--
ALTER TABLE `paiement_facture`
  ADD CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `facture` (`rowid`),
  ADD CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `paiement` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `payment_salary`
--
ALTER TABLE `payment_salary`
  ADD CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `prelevement_facture`
--
ALTER TABLE `prelevement_facture`
  ADD CONSTRAINT `fk_prelevement_facture_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `prelevement_lignes` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `prelevement_lignes`
--
ALTER TABLE `prelevement_lignes`
  ADD CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `prelevement_bons` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `entrepot` (`rowid`),
  ADD CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `c_country` (`rowid`),
  ADD CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_batch`
--
ALTER TABLE `product_batch`
  ADD CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `product_stock` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_customer_price`
--
ALTER TABLE `product_customer_price`
  ADD CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_fournisseur_price`
--
ALTER TABLE `product_fournisseur_price`
  ADD CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `c_barcode_type` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`),
  ADD CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_lang`
--
ALTER TABLE `product_lang`
  ADD CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_price`
--
ALTER TABLE `product_price`
  ADD CONSTRAINT `fk_product_price_product` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `product` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `product_price_by_qty`
--
ALTER TABLE `product_price_by_qty`
  ADD CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `product_price` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `projet_task`
--
ALTER TABLE `projet_task`
  ADD CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `propal`
--
ALTER TABLE `propal`
  ADD CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `projet` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `propaldet`
--
ALTER TABLE `propaldet`
  ADD CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `propal` (`rowid`),
  ADD CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `reception`
--
ALTER TABLE `reception`
  ADD CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `c_shipment_mode` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `c_country` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `societe_account`
--
ALTER TABLE `societe_account`
  ADD CONSTRAINT `societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `societe_account_fk_website` FOREIGN KEY (`fk_website`) REFERENCES `website` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `societe_remise_except`
--
ALTER TABLE `societe_remise_except`
  ADD CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `facturedet` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `facture_fourn_det` (`rowid`),
  ADD CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `facture` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `facture_fourn` (`rowid`),
  ADD CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `socpeople`
--
ALTER TABLE `socpeople`
  ADD CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `societe` (`rowid`),
  ADD CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `supplier_proposaldet`
--
ALTER TABLE `supplier_proposaldet`
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `supplier_proposal` (`rowid`),
  ADD CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `c_units` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `usergroup_rights`
--
ALTER TABLE `usergroup_rights`
  ADD CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `usergroup` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `usergroup_user`
--
ALTER TABLE `usergroup_user`
  ADD CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`),
  ADD CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `usergroup` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `user_employment`
--
ALTER TABLE `user_employment`
  ADD CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `user_rights`
--
ALTER TABLE `user_rights`
  ADD CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `user` (`rowid`);

--
-- Ketidakleluasaan untuk tabel `website_page`
--
ALTER TABLE `website_page`
  ADD CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `website` (`rowid`);
COMMIT;
