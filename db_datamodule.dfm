object DBDataModule: TDBDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 276
  Width = 512
  object DBConnection: TUniConnection
    ProviderName = 'MySQL'
    SpecificOptions.Strings = (
      'MySQL.UseUnicode=True')
    LoginPrompt = False
    BeforeConnect = DBConnectionBeforeConnect
    Left = 32
    Top = 16
  end
  object MysqlDriver: TMySQLUniProvider
    Left = 32
    Top = 72
  end
end