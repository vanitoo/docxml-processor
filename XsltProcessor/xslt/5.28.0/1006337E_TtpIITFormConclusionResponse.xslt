<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:ttpRes="urn:customs.ru:Information:CustomsDocuments:TtpIITFormConclusionResponse:5.24.0">
  <!-- Шаблон для типа TtpIITFormConclusionResponseType -->
  <xsl:template match="ttpRes:TtpIITFormConclusionResponse">
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
                    <b>Ответ на запрос на получение сведений из заключений формы идентификации иностранных товаров</b>
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
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Регистрационный номер заключения формы ИИТ, как он получен из запроса</td>
              <td class="value graphMain" style="width:50%">
                <xsl:apply-templates select="ttpRes:referenceNo" />
              </td>
            </tr>
          </table>
          <table>
            <tr>
              <td class="annot graphMain" style="width:50%">Дата выдачи заключения формы ИИТ, как он получен из запроса</td>
              <td class="value graphMain" style="width:50%">
                <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ttpRes:issued"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ttpRes:issued, 12, 5)"/>
              </td>
            </tr>
          </table>
          <xsl:if test="ttpRes:certificate">
            <div class="title marg-top">Данные заключения формы ИИТ</div>
            <div>
              <xsl:apply-templates select="ttpRes:certificate">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </div>
          </xsl:if>
        </div>
      </body>
    </html>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:PersonType -->
  <xsl:template match="ttpRes:Person">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:lastName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Имя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:firstName" />
          </td>
        </tr>
      </table>
      <xsl:if test="ttpRes:secondName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Отчество</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="ttpRes:secondName" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:smevCertificateDTO -->
  <xsl:template match="ttpRes:certificate">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Тип заявител (два символа): юридическое лицо (ЮЛ) или индивидуальный предприниматель (ИП)</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:senderType" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Наименование заявителя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:senderTitle" />
          </td>
        </tr>
      </table>
      <xsl:if test="ttpRes:Person">
        <div class="title marg-top">ФИО заявителя</div>
        <div>
          <xsl:apply-templates select="ttpRes:Person">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <xsl:if test="ttpRes:senderAddress">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Адрес заявителя</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="ttpRes:senderAddress" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="ttpRes:senderOgrn">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ОГРН заявителя (для ЮЛ)/ ОГРНИП (для ИП)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="ttpRes:senderOgrn" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">ИНН заявителя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:senderInn" />
          </td>
        </tr>
      </table>
      <xsl:if test="ttpRes:senderKpp">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">КПП заявителя (для ЮЛ)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="ttpRes:senderKpp" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="ttpRes:passportDetails">
        <div class="title marg-top">Паспорт заявителя (для ИП)</div>
        <div>
          <xsl:apply-templates select="ttpRes:passportDetails">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </div>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Регистрационный номер Заключения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:referenceNo" />
          </td>
        </tr>
      </table>
      <xsl:if test="ttpRes:supportInfo">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Сведения, указанные в графе 3 Заключения (служебные отметки)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="ttpRes:supportInfo" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Количество листов приложения к Заключению</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:annexSheetCount" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия и инициалы уполномоченного лица заявителя</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:declaratorName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Фамилия и инициалы лица, уполномоченного удостоверять Заключение</td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="ttpRes:issuerName" />
          </td>
        </tr>
      </table>
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Дата удостоверения Заключения</td>
          <td class="value graphMain" style="width:50%">
            <xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="ttpRes:issued"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring(ttpRes:issued, 12, 5)"/>
          </td>
        </tr>
      </table>
      <xsl:if test="ttpRes:itemList">
        <div class="title marg-top">Список товаров заключения формы ИИТ</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер товарной позиции</td>
              <td class="graphMain bordered">Описание товара</td>
              <td class="graphMain bordered">Код товара по ТН ВЭД ЕАЭС</td>
              <td class="graphMain bordered">Количество товара (вес нетто)</td>
              <td class="graphMain bordered">Количество товара (вес брутто)</td>
              <td class="graphMain bordered">Количество товара в дополнительных единицах измерения</td>
              <td class="graphMain bordered">Сведения, указанные в графе 8 Заключения (номер и дата счета-фактуры)</td>
            </tr>
            <xsl:for-each select="ttpRes:itemList">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="ttpRes:internalRawMaterialsList">
        <div class="title marg-top">Полностью произведенные товары</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Наименование сырья, комплектующих и упаковочных материалов</td>
              <td class="graphMain bordered">Количество сырья в основных единицах измерения</td>
              <td class="graphMain bordered">Количество сырья в дополнительных единицах измерения</td>
              <td class="graphMain bordered">Сведения о документах, подтверждающих приобретение (владение) сырья</td>
              <td class="graphMain bordered">Порядковый номер готовой продукции из графы "Примечание"</td>
            </tr>
            <xsl:for-each select="ttpRes:internalRawMaterialsList">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="ttpRes:unionRawMaterialsList">
        <div class="title marg-top">Товары ЕАЭС</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Номер транзитной декларации</td>
              <td class="graphMain bordered">Сведения о транспортных и/или коммерческих документах</td>
              <td class="graphMain bordered">Наименование сырья, комплектующих и упаковочных материалов</td>
              <td class="graphMain bordered">Количество сырья в основных единицах измерения</td>
              <td class="graphMain bordered">Количество сырья в дополнительных единицах измерения</td>
              <td class="graphMain bordered">Сведения о документах, подтверждающих приобретение (владение) сырья</td>
              <td class="graphMain bordered">Порядковый номер готовой продукции из графы "Примечание"</td>
            </tr>
            <xsl:for-each select="ttpRes:unionRawMaterialsList">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
      <xsl:if test="ttpRes:foreignRawMaterialsList">
        <div class="title marg-top">Иностранные товары</div>
        <table class="bordered">
          <tbody>
            <tr class="title">
              <td class="graphMain bordered">Код ТН ВЭД ЕАЭС</td>
              <td class="graphMain bordered">Номер товара в декларации на товары</td>
              <td class="graphMain bordered">Номер декларации на товары</td>
              <td class="graphMain bordered">Наименование сырья, комплектующих и упаковочных материалов</td>
              <td class="graphMain bordered">Количество сырья в основных единицах измерения</td>
              <td class="graphMain bordered">Количество сырья в дополнительных единицах измерения, для учета на пердприятии</td>
              <td class="graphMain bordered">Сведения о документах, подтверждающих приобретение (владение) сырья</td>
              <td class="graphMain bordered">Порядковый номер готовой продукции из графы "Примечание"</td>
            </tr>
            <xsl:for-each select="ttpRes:foreignRawMaterialsList">
              <xsl:apply-templates select=".">
                <xsl:with-param name="wdth" select="$w" />
              </xsl:apply-templates>
            </xsl:for-each>
          </tbody>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:smevCertificateForeignRawMaterialDTO -->
  <xsl:template match="ttpRes:foreignRawMaterialsList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:tnved" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:customsItemOrder" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:customsNumber">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:title" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemCount">
            <xsl:with-param name="wdth" select="$w" />
          </xsl:apply-templates>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="ttpRes:extraItemCount">
            <xsl:apply-templates select="ttpRes:extraItemCount">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:documents" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemIdx" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:smevCertificateInternalRawMaterialDTO -->
  <xsl:template match="ttpRes:internalRawMaterialsList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:title" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemCount"/>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="ttpRes:extraItemCount">
            <xsl:apply-templates select="ttpRes:extraItemCount">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:documents" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemIdx" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
  <xsl:template match="ttpRes:itemCount | ttpRes:extraItemCount | ttpRes:extraCount">
		<xsl:value-of select="translate(cat_ru:GoodsQuantity, '.', ',')"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="cat_ru:MeasureUnitQualifierName"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (код: </xsl:text>
			<xsl:value-of select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:smevCertificateItemDTO -->
  <xsl:template match="ttpRes:itemList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemOrder" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:description" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:tnved" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:weightNetto" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:weightBrutto" mode="translate_number" />
        </td>
        <td class="graphMain bordered">
          <xsl:if test="ttpRes:extraCount">
            <xsl:apply-templates select="ttpRes:extraCount">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:invoice" />
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
  <xsl:template match="ttpRes:passportDetails">
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
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
  <xsl:template match="ttpRes:transitDecl | ttpRes:customsNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
  </xsl:template>
  <!-- Шаблон для типа ttpRes:smevCertificateUnionRawMaterialDTO -->
  <xsl:template match="ttpRes:unionRawMaterialsList">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:transitDecl"/>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:transitDoc" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:title" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemCount"/>
        </td>
        <td class="graphMain bordered">
          <xsl:if test="ttpRes:extraItemCount">
            <xsl:apply-templates select="ttpRes:extraItemCount">
              <xsl:with-param name="wdth" select="$w" />
            </xsl:apply-templates>
          </xsl:if>
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:documents" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="ttpRes:itemIdx" />
        </td>
      </tr>
    </div>
  </xsl:template>
	<xsl:template match="*" mode="gtd_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="gtd_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template name="gtd_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
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
  <xsl:template match="//*[local-name()='TtpIITFormConclusionResponse']//*" priority="-1">
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