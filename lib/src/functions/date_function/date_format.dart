/// dateTime   =>  03/11/2023 - 11:00 AM
///
/// date       =>  03/11/2023
///
/// dateApi    =>  2023-11-03
///
/// dateSlash  =>  03/11/2023
///
/// date168    =>  03 Nov 2023
///
/// dateMD     =>  Nov 03
///
/// time       =>  11:00 AM
///
/// mMyyyy     =>  Nov, 2023
///
/// mMMMyyyy   =>  November, 2023
///
/// numMonth   =>  3 Nov
///
/// numDay     =>  Fri
///
/// fullDate   =>  3 November 2023
///
/// shortDate  =>  3 Nov 2023
///
/// longDate   =>  Friday, 3 November 2023
///
/// isoDate    =>  2023-11-03T11:00:00
///
/// hourMinute =>  11:00
///
/// monthYear  =>  11/2023
///
/// custom     =>  03-11-2023 11:00 AM
///
/// quarter    =>  Q4 2023
///
/// weekDay    =>  3 Friday 2023
///
/// shortTime  =>  11:00 AM
///
/// fullTime   =>  11:00:00 AM
///
/// dayMonth   =>  3 Nov
///
/// weekNumber =>  45
/// year       =>  2023
///
/// yearMonth  =>  2023-11
///
/// romanDate  =>  III (for November)
///
/// dayOfYear  =>  307 (Day of year)
///
/// weekStart  =>  Monday, 1 January 2023
///
/// timeZone   =>  11:00 AM GMT+3
///
/// french     =>  3 november 2023
///
/// german     =>  3. November 2023
///
/// longIsoDate=>  2023-11-03T11:00:00.000
///
/// dayAndShortMonth =>  Sun, 28 Jan
///
enum DateFormats {
  /// dateTime   =>  03/11/2023 - 11:00 AM
  ///
  /// Full date and time format with AM/PM.
  dateTime,

  /// date       =>  03/11/2023
  ///
  /// Standard date format (DD/MM/YYYY).
  date,

  /// dateApi    =>  2023-11-03
  ///
  /// Date format suitable for API, usually ISO 8601 (YYYY-MM-DD).
  dateApi,

  /// dateSlash  =>  03/11/2023
  ///
  /// Similar to `date`, but specifically using slashes (DD/MM/YYYY).
  dateSlash,

  /// date168    =>  03 Nov 2023
  ///
  /// Short date format with month as abbreviation (DD MMM YYYY).
  date168,

  /// dateMD     =>  Nov 03
  ///
  /// Month abbreviation and day (MMM DD).
  dateMD,

  /// time       =>  11:00 AM
  ///
  /// Time format with AM/PM (hh:mm a).
  time,

  /// mMyyyy     =>  Nov, 2023
  ///
  /// Month abbreviation and year (MMM, YYYY).
  mMyyyy,

  /// mMMMyyyy   =>  November, 2023
  ///
  /// Full month name and year (MMMM, YYYY).
  mMMMyyyy,

  /// numMonth   =>  3 Nov
  ///
  /// Numeric day and abbreviated month (D MMM).
  numMonth,

  /// numDay     =>  Fri
  ///
  /// Day of the week abbreviation (e.g., "Mon", "Tue").
  numDay,

  /// fullDate   =>  3 November 2023
  ///
  /// Full date format with day, full month name, and year (D MMMM YYYY).
  fullDate,

  /// shortDate  =>  3 Nov 2023
  ///
  /// Short date format (D MMM YYYY).
  shortDate,

  /// longDate   =>  Friday, 3 November 2023
  ///
  /// Long date format with weekday, day, full month name, and year (Weekday, D MMMM YYYY).
  longDate,

  /// isoDate    =>  2023-11-03T11:00:00
  ///
  /// ISO 8601 date and time format with "T" separator (YYYY-MM-DDTHH:mm:ss).
  isoDate,

  /// hourMinute =>  11:00
  ///
  /// Hour and minute only (HH:mm).
  hourMinute,

  /// monthYear  =>  11/2023
  ///
  /// Month and year (MM/YYYY).
  monthYear,

  /// monthYear  =>  11/2023
  ///
  /// Month and year ('EEEE, MMMM dd').
  weekdayMonthDay,

  /// custom     =>  03-11-2023 11:00 AM
  ///
  /// Custom date and time format (DD-MM-YYYY hh:mm a).
  custom,

  /// quarter    =>  Q4 2023
  ///
  /// Quarter format with year (Q# YYYY).
  quarter,

  /// weekDay    =>  3 Friday 2023
  ///
  /// Weekday with numeric day and year (D Weekday YYYY).
  weekDay,

  /// shortTime  =>  11:00 AM
  ///
  /// Short time format with AM/PM (hh:mm a).
  shortTime,

  /// fullTime   =>  11:00:00 AM
  ///
  /// Full time format with seconds (hh:mm:ss a).
  fullTime,

  /// dayMonth   =>  3 Nov
  ///
  /// Day and abbreviated month (D MMM).
  dayMonth,

  /// weekNumber =>  45
  ///
  /// Week number of the year (week number).
  weekNumber,

  /// year       =>  2023
  ///
  /// Year only (YYYY).
  year,

  /// yearMonth  =>  2023-11
  ///
  /// Year and month (YYYY-MM).
  yearMonth,

  /// romanDate  =>  III (for November)
  ///
  /// Roman numeral for the month (e.g., I, II, III, ...).
  romanDate,

  /// dayOfYear  =>  307 (Day of year)
  ///
  /// Day of the year (1 to 365/366).
  dayOfYear,

  /// weekStart  =>  Monday, 1 January 2023
  ///
  /// First day of the week (Weekday, D MMMM YYYY).
  weekStart,

  /// timeZone   =>  11:00 AM GMT+3
  ///

  /// Time with timezone information (hh:mm a GMT+X).
  timeZone,

  /// french     =>  3 novembre 2023
  ///
  /// French date format (D MMMM YYYY).
  french,

  /// german     =>  3. November 2023
  ///
  /// German date format (D. MMMM YYYY).
  german,

  /// longIsoDate=>  2023-11-03T11:00:00.000
  ///
  /// ISO 8601 format with milliseconds (YYYY-MM-DDTHH:mm:ss.sss).
  longIsoDate,

  /// dayAndShortMonth =>  Sun, 28 Jan
  ///
  /// French date format ('EEE, dd MMM').
  dayAndShortMonth,
}

extension DateFormatsExtension on DateFormats {
  String get format {
    switch (this) {
      case DateFormats.dateTime:
        return "dd-MM-yyyy - hh:mm a";
      case DateFormats.date:
        return "dd-MM-yyyy";
      case DateFormats.dateApi:
        return "yyyy-MM-dd";
      case DateFormats.dateSlash:
        return "dd/MM/yyyy";
      case DateFormats.date168:
        return "dd MMM yyyy";
      case DateFormats.dateMD:
        return "MMM dd";
      case DateFormats.time:
        return "hh:mm a";
      case DateFormats.mMyyyy:
        return "MMM, yyyy";
      case DateFormats.mMMMyyyy:
        return "MMMM, yyyy";
      case DateFormats.numMonth:
        return "d MMM";
      case DateFormats.dayAndShortMonth:
        return 'EEE, dd MMM';
      case DateFormats.numDay:
        return "EEE";
      case DateFormats.fullDate:
        return "d MMMM yyyy";
      // e.g., 5 December 2024
      case DateFormats.shortDate:
        return "d MMM yyyy"; // e.g., 5 Dec 2024
      case DateFormats.longDate:
        return "EEEE, d MMMM yyyy"; // e.g., Thursday, 5 December 2024
      case DateFormats.isoDate:
        return "yyyy-MM-dd'T'HH:mm:ss"; // ISO format
      case DateFormats.hourMinute:
        return "hh:mm"; // e.g., 04:25
      case DateFormats.monthYear:
        return "MM/yyyy"; // e.g., 12/2024
      case DateFormats.custom:
        return "dd-MM-yyyy hh:mm a"; // Example of custom format
      case DateFormats.quarter:
        return "Q# yyyy"; // e.g., Q1 2024
      case DateFormats.weekDay:
        return "d EEEE yyyy"; // e.g., 5 Thursday 2024
      case DateFormats.shortTime:
        return "h:mm a"; // e.g., 4:25 PM
      case DateFormats.fullTime:
        return "hh:mm:ss a"; // e.g., 04:25:59 PM
      case DateFormats.dayMonth:
        return "d MMM"; // e.g., 5 Dec
      case DateFormats.weekNumber:
        return "w"; // e.g., 50
      case DateFormats.year:
        return "yyyy"; // e.g., 2024
      case DateFormats.yearMonth:
        return "yyyy-MM"; // e.g., 2024-12
      case DateFormats.romanDate:
        return "M"; // Roman numeral for months (e.g., I for January)
      case DateFormats.dayOfYear:
        return "DDD"; // Day of year (e.g., 200)
      case DateFormats.weekStart:
        return "EEEE, d MMMM yyyy"; // Start of the week
      case DateFormats.timeZone:
        return "hh:mm a z"; // Time zone info (e.g., 04:25 PM GMT+2)
      case DateFormats.french:
        return "d MMMM yyyy"; // French Date format (e.g., 5 décember 2024)
      case DateFormats.german:
        return "d. MMMM yyyy"; // German Date format (e.g., 5. December 2024)
      case DateFormats.longIsoDate:
        return "yyyy-MM-dd'T'HH:mm:ss.SSS"; // ISO 8601 with milliseconds
      case DateFormats.weekdayMonthDay:
        return "EEEE, MMMM dd"; // ISO 8601 with milliseconds
    }
  }
}
