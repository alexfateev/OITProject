object DBDataModule: TDBDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 276
  Width = 512
  object DBConnection: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'oit_project'
    SpecificOptions.Strings = (
      'MySQL.UseUnicode=True')
    Username = 'root'
    Server = 'localhost'
    LoginPrompt = False
    BeforeConnect = DBConnectionBeforeConnect
    Left = 32
    Top = 16
    EncryptedPassword = 'A9FF9AFF9CFF8DFF9AFF94FF'
  end
  object MysqlDriver: TMySQLUniProvider
    Left = 32
    Top = 72
  end
  object tDivision: TUniTable
    TableName = 'divisions'
    Connection = DBConnection
    Left = 232
    Top = 88
  end
end
