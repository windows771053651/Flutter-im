enum StrangerVerificationStatus {
  /// 陌生人状态
  STRANGER,
  /// 验证中，在确认状态
  CHECKING,
  /// 验证通过
  VALIDATION_PASSED,
  /// 已过期
  EXPIRED,
}