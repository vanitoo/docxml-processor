<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:aecmd="urn:customs.ru:Information:CustomsDocuments:Add_E_ComMPODeclaration:5.28.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUDECLcat="urn:customs.ru:RUDeclCommonAggregateTypesCust:5.28.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cltESAD_cu="urn:customs.ru:CUESADCommonLeafTypes:5.17.0">
  <!-- Шаблон для типа Add_E_ComMPODeclarationType -->
  <xsl:template match="aecmd:Add_E_ComMPODeclaration">
    <xsl:param name="w" select="190" />
    <html>
      <head>
        <style>
                  body {
                  background: #cccccc;
                  }

                  div
                  {
                  white-space: normal;
                  }

                  div.page {
                  margin: 10px auto;
                  margin-top: 6pt;
                  margin-bottom: 6pt;
                  padding: 10mm 10mm 10mm 20mm;
                  background: #ffffff;
                  border: solid 1pt #000000;
                  }

                  .marg-top
                  {
                  margin-top:5mm;
                  }

                  table
                  {
                  width: 100%;
                  border: 0;
                  empty-cells: show;
                  border-collapse: collapse;
                  margin-top: 1px;
                  }

                  table.border tr td
                  {
                  border: 1px solid windowtext;
                  }

                  .value
                  {
                  border-bottom: solid 1px black;
                  font-family: Arial;
                  font-size: 11pt;
                  font-style: italic;
                  }

                  .annot
                  {
                  font-family: Arial;
                  font-size: 11pt;
                  }


                  .title
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 11pt;
                  }

                  tr.title td
                  {
                  font-weight:bold;
                  font-family: Arial;
                  font-size: 9pt;
                  }



                  .bordered { border-collapse: collapse; }
                  td.bordered
                  {
                  border: solid 1px windowtext;
                  }

                  td.graphMain
                  {
                  vertical-align:top;
                  }
                  td.value.graphMain
                  {
                  vertical-align:bottom;
                  }
                </style>
      </head>
      <body>
        <div class="page" style="width: {$w}mm;">
          <table>
            <tbody>
              <tr>
                <td align="center" class="title">
                  <font size="4">
                    <b>Доп. сведения к декларации на товары на МПО</b>
                  </font>
                </td>
              </tr>
            </tbody>
          </table>
          <br />
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="cat_ru:DocumentID" />
              </td>
            </tr>
          </table>
          <xsl:if test="cat_ru:RefDocumentID">
            <table>
              <tr>
                <td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
                <td class="value graphMain" style="width:50%">
                  <xsl:apply-templates select="cat_ru:RefDocumentID" />
                </td>
              </tr>
            </table>
          </xsl:if>
          <xsl:if test="aecmd:EECEDocHeaderAddInfo">
            <div class="title marg-top">Дополнительные технологические реквизиты электронного документа (сведений)</div>
            <div>
              <xsl:apply-templates select="aecmd:EECEDocHeaderAddInfo">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Код таможенной процедуры в соответствии с классификатором видов таможенных процедур </td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="aecmd:CustomsModeCode" />
              </td>
            </tr>
          </table>
          <xsl:if test="aecmd:DT_Number">
            <div class="title marg-top">Регистрационный номер декларации на товары</div>
            <div>
              <xsl:apply-templates select="aecmd:DT_Number">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <div class="title marg-top">Сведения о товарах ДТ</div>
          <table class="bordered">
            <tbody>
              <tr class="title">
                <td class="graphMain bordered">Порядковый номер товара в ДТ</td>
                <td class="graphMain bordered">Сведения об МПО, в котором товар поступил на таможенную территорию ЕАЭС (на территорию Российской Федерации) / убывает при реэкспорте</td>
              </tr>
              <xsl:for-each select="aecmd:DT_GoodsDetails">
                <xsl:apply-templates select=".">
                  <xsl:with-param name="wdth" select="$w" />
                </xsl:apply-templates>
              </xsl:for-each>
            </tbody>
          </table>
          <xsl:if test="aecmd:DesignatedPostalOperator">
            <div class="title marg-top">Сведения о назначенном операторе почтовой связи</div>
            <div>
              <xsl:apply-templates select="aecmd:DesignatedPostalOperator">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="aecmd:CustomCode">
            <div class="title marg-top">Код таможенного органа, в регионе деятельности которого находится таможенный склад, расположенный в ММПО</div>
            <div>
              <xsl:apply-templates select="aecmd:CustomCode">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
          <xsl:if test="aecmd:SignatoryPerson">
            <div class="title marg-top">Сведения о лице, заполнившем (подписавшем) таможенный документ</div>
            <div>
              <xsl:apply-templates select="aecmd:SignatoryPerson">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
  <xsl:template match="RUDECLcat:DocArchIdDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="catESAD_cu:ElectronicDocumentID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicDocumentID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:ElectronicArchID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:ElectronicArchID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocumentModeID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocumentModeID" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="RUScat_ru:CommunicationDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:CustomsType -->
  <xsl:template match="aecmd:CustomCode">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:Code" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:OfficeName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OfficeName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа aecmd:DT_GoodsDetailsType -->
  <xsl:template match="aecmd:DT_GoodsDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="aecmd:DTGoodsNumeric" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="aecmd:MPODetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
      </tr>
    <!--/div-->
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="aecmd:DT_Number">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код таможенного органа, зарегистрировавшего документ</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CustomsCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата регистрации документа</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Порядковый номер документа по журналу регистрации</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:GTDNumber" />
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:OrganizationType -->
  <xsl:template match="aecmd:DesignatedPostalOperator">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации / ФИО физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ShortName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование организации</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ShortName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OrganizationLanguage">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код языка для заполнения наименования </td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OrganizationLanguage" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RFOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Российской Федерации</div>
        <div>
          <xsl:apply-templates select="cat_ru:RFOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RKOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Казахстан</div>
        <div>
          <xsl:apply-templates select="cat_ru:RKOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RBOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Беларусь</div>
        <div>
          <xsl:apply-templates select="cat_ru:RBOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:RAOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Республики Армения</div>
        <div>
          <xsl:apply-templates select="cat_ru:RAOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:KGOrganizationFeatures">
        <div class="title marg-top">Сведения об организации. Особенности Кыргызской Республики</div>
        <div>
          <xsl:apply-templates select="cat_ru:KGOrganizationFeatures">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:OKPOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код организации по ОКПО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OKPOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:OKATOCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OKATOCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Address">
        <div class="title marg-top">Адрес </div>
        <div>
          <xsl:apply-templates select="cat_ru:Address">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="cat_ru:Contact">
        <div class="title marg-top">Контактная информация</div>
        <div>
          <xsl:apply-templates select="cat_ru:Contact">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:EECEDocHeaderAddInfoType -->
  <xsl:template match="aecmd:EECEDocHeaderAddInfo">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:InfEnvelopeCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение сообщения общего процесса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:InfEnvelopeCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Кодовое обозначение электронного документа (сведений) в соответствии с реестром структур электронных документов и сведений</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:EDocCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата и время создания электронного документа (сведений)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:EDocDateTime" mode="russian_date"/>
          </td>
        </tr>
      </table>
      <xsl:if test="RUScat_ru:LanguageCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение языка</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:LanguageCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:SourceCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны - отправителя сообщения alpha-2 (две буквы латинского алфавита)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:SourceCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DestinationCountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны - получателя сообщения alpha-2 (две буквы латинского алфавита)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:DestinationCountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа aecmd:MPODetailsType -->
  <xsl:template match="aecmd:MPODetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
		<xsl:if test="position()!=1"><br/></xsl:if>
          <xsl:apply-templates select="aecmd:MPO_Number" />
          <br/>
          <xsl:apply-templates select="aecmd:MPO_GoodsDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
  </xsl:template>
  <!-- Шаблон для типа aecmd:MPO_GoodsDetailsType -->
  <xsl:template match="aecmd:MPO_GoodsDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
   
			<xsl:if test="position()!=1">
				<br/>
			</xsl:if>
          <xsl:apply-templates select="aecmd:GoodsNumeric" />
          <xsl:text> </xsl:text>
          <xsl:for-each select="aecmd:UINGoods">
            <xsl:if test="position()!=1">
              <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
          <xsl:text>; </xsl:text>
          <xsl:for-each select="aecmd:GoodsDescription">
            <xsl:apply-templates select="." />
          </xsl:for-each>
          
  </xsl:template>
  <!-- Шаблон для типа catESAD_cu:DocBaseType -->
  <xsl:template match="aecmd:PowerOfAttorneyDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PrDocumentName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PrDocumentDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата документа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocStartDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата начала срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocStartDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocValidityDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="catESAD_cu:DocKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа в соответствии с классификатором видов документов и сведений, используемых при таможенном декларировании</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="catESAD_cu:DocKindCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа aecmd:SignatoryPersonDetailsType -->
  <xsl:template match="aecmd:SignatoryPerson">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="aecmd:SigningDetails">
        <div class="title marg-top">Cведения о должностном лице, подписавшем документ</div>
        <div>
          <xsl:apply-templates select="aecmd:SigningDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="aecmd:SignatoryPersonIdentityDetails">
        <div class="title marg-top">Сведения о документе, удостоверяющем личность лица, заполнившего (подписавшего) таможенный документ</div>
        <div>
          <xsl:apply-templates select="aecmd:SignatoryPersonIdentityDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="aecmd:QualificationCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер квалификационного аттестата специалиста по таможенному оформлению</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="aecmd:QualificationCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="aecmd:PowerOfAttorneyDetails">
        <div class="title marg-top">Документ, удостоверяющий полномочия</div>
        <div>
          <xsl:apply-templates select="aecmd:PowerOfAttorneyDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUDECLcat:SignatoryPersonIdentityDetailsType -->
  <xsl:template match="aecmd:SignatoryPersonIdentityDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:IdentityCardCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность, в соответствии с классификатором видов документов, удостоверяющих личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:FullIdentityCardName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Полное наименование документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:FullIdentityCardName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardSeries">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardSeries" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IdentityCardDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:DocValidityDate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Дата окончания срока, в течение которого документ имеет силу</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:DocValidityDate" mode="russian_date" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OrganizationName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OrganizationName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:IssuerCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код подразделения органа, выдавшего документ, удостоверяющий личность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:IssuerCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AuthorityId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Строка, идентифицирующая орган государственной власти государства-члена либо уполномоченную им организацию, выдавшую документ</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AuthorityId" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Кодовое обозначение страны</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUDECLcat:DocArchIdDetails">
        <div class="title marg-top">Идентификаторы, присвоенные документу (сведениям) при размещении в хранилище электронных документов</div>
        <div>
          <xsl:apply-templates select="RUDECLcat:DocArchIdDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:SigningDetailsType -->
  <xsl:template match="aecmd:SigningDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonSurname" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:PersonName" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:PersonMiddleName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonMiddleName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:PersonPost">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Должность</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PersonPost" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CommunicationDetails">
        <div class="title marg-top">Сведения о контактных реквизитах</div>
        <div>
          <xsl:apply-templates select="RUScat_ru:CommunicationDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата подписания</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="RUScat_ru:SigningDate" mode="russian_date"/>
          </td>
        </tr>
      </table>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:AddressType -->
  <xsl:template match="cat_ru:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица, номер дома, номер офиса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код административно-территориальной единицы в соответствии с ГК СОАТЕ (для Кыргызской Республики)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ContactType -->
  <xsl:template match="cat_ru:Contact">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:Phone">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телефона</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:Phone">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Fax">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер факса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Fax" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:Telex">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер телекса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:Telex" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:E_mail">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
            <td class="graphMain value" style="width:50%">
              <xsl:for-each select="cat_ru:E_mail">
                <xsl:value-of select="." />
                <xsl:if test="position()!=last()">
                  <xsl:text>, </xsl:text>
                </xsl:if>
              </xsl:for-each>
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:ITNKZType -->
  <xsl:template match="cat_ru:ITN">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Категория лица. Двухзначный цифровой код категории лица согласно учредительным документам или свидетельству о регистрации в качестве индивидуального предпринимателя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:CategoryCode" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код КАТО. Двухзначный код КАТО в соответствии с классификатором кодов административно-территориальных объектов</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="cat_ru:KATOCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="cat_ru:RNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">РНН. Регистрационный налоговый номер, присваиваемый налоговыми органами Республики Казахстан</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITNReserv">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Резерв для ИТН</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:ITNReserv" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:KGOrganizationFeaturesType -->
  <xsl:template match="cat_ru:KGOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:KGINN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - идентификационный налоговый номер налогоплательщика, ПИН - персональный идентификационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="cat_ru:KGINN='ИНН'">
                  <xsl:text>идентификационный налоговый номер налогоплательщика</xsl:text>
                </xsl:when>
                <xsl:when test="cat_ru:KGINN='ПИН'">
                  <xsl:text>персональный идентификационный номер</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="cat_ru:KGINN" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KGOKPO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код Общереспубликанского классификатора предприятий и организаций (ОКПО) для юридических лиц и индивидуальных предпринимателей</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KGOKPO" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RAOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RAOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер налогоплательщика (УНН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номерной знак общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:SocialServiceCertificate">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер справки об отсутствии номерного знака общественных услуг (НЗОУ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:SocialServiceCertificate" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RBOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RBOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:UNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Учетный номер плательщика (УНП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:UNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:RBIdentificationNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Идентификационный номер физического лица</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:RBIdentificationNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RFOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:OGRN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН/ОГРНИП. Основной государственный регистрационный номер</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:OGRN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:INN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:INN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:KPP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП - Код причины постановки на учет</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:KPP" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:RKOrganizationFeaturesType -->
  <xsl:template match="cat_ru:RKOrganizationFeatures">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="cat_ru:BIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Бизнес-идентификационный номер (БИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:BIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:IIN">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Индивидуальный идентификационный номер (ИИН)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="cat_ru:IIN" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="cat_ru:ITN">
        <div class="title marg-top">Идентификационный таможенный номер (ИТН)</div>
        <div>
          <xsl:apply-templates select="cat_ru:ITN">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
    </div>
  </xsl:template>
  <xsl:template name="russian_date">
    <xsl:param name="dateIn" />
    <xsl:choose>
      <xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
        <xsl:value-of select="substring($dateIn,9,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,6,2)" />
        <xsl:text>.</xsl:text>
        <xsl:value-of select="substring($dateIn,1,4)" />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$dateIn" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="//*[local-name()='Add_E_ComMPODeclaration']//*" priority="-1">
    <xsl:variable name="xpath">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="current()" />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath}">
      <xsl:apply-templates />
    </element>
  </xsl:template>
  <xsl:template name="get_xpath">
    <xsl:param name="node" select="." />
    <xsl:variable name="xpath">
      <xsl:for-each select="$node/ancestor-or-self::*">
        <xsl:variable name="name">
          <xsl:value-of select="name()" />
        </xsl:variable>
        <xsl:variable name="pos">
          <xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])" />
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="position()=last()">
            <xsl:value-of select="concat($name,'[',$pos,']')" />
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat($name,'[',$pos,']','/')" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$xpath" />
  </xsl:template>
  <xsl:template match="*" mode="date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="russian_date">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:call-template name="russian_date">
        <xsl:with-param name="dateIn" select="." />
      </xsl:call-template>
    </element>
  </xsl:template>
  <xsl:template match="*" mode="translate_number">
    <xsl:variable name="xpath_date">
      <xsl:call-template name="get_xpath">
        <xsl:with-param name="node" select="." />
      </xsl:call-template>
    </xsl:variable>
    <element xml_node="{$xpath_date}">
      <xsl:value-of select="translate(.,'.', ',')" />
    </element>
  </xsl:template>
</xsl:stylesheet>