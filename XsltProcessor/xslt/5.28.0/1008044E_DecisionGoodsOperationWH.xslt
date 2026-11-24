<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:dgowh="urn:customs.ru:Information:WarehouseDocuments:DecisionGoodsOperationWH:5.24.0">
	<!-- Шаблон для типа DecisionGoodsOperationWHType -->
	<xsl:template match="dgowh:DecisionGoodsOperationWH">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<style>
					body
					{background: #cccccc;}

					div
					{white-space: normal;}

					div.page
					{margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					table.border tr td
					{border: 1px solid windowtext;}

					.value
					{border-bottom: solid 1px black;
					font-family: Arial;
					font-size: 11pt;
					font-style: italic;}

					.annot
					{font-family: Arial;
					font-size: 11pt;}

					.title
					{font-weight:bold;
					font-family: Arial;
					font-size: 11pt;}

					tr.title td
					{font-weight:bold;
					font-family: Arial;
					font-size: 9pt;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}
				</style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>Решение по заявлению лица, обладающего полномочиями в отношении товаров, о необходимости совершения в отношении товаров, находящихся под таможенным контролем, операций, предусмотренных подпунктами 1 и 2 пункта 1 статьи 84 и статьей 102 ТК ЕАЭС</b>
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
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<br/>
					<xsl:if test="dgowh:AppGoodsOperNumber">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Регистрационный номер Заявления о необходимости совершения операций в отношении товаров, находящихся под таможенным контролем</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="dgowh:AppGoodsOperNumber" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<div class="title marg-top">Сведения о транспортном средстве, на котором размещены либо прибыли товары</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Код вида транспортного средства</td>
								<td class="graphMain bordered">Идентификатор. Номер транспортного средства, наименование судна, номер авиарейса, номер поезда, номер железнодорожного вагона (платформ, цистерн и т.п.)</td>
								<td class="graphMain bordered">Буквенный код страны принадлежности транспортного средства по классификатору стран мира</td>
								<td class="graphMain bordered">Номер контейнера</td>
							</tr>
							<xsl:for-each select="dgowh:TransportDetails">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w" />
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="dgowh:WHDetails">
						<div class="title marg-top">Сведения о месте нахождения товаров </div>
						<div>
							<xsl:apply-templates select="dgowh:WHDetails">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Дата и время принятия решения </td>
							<td class="value graphMain" style="width:50%">
								<xsl:call-template name="date_time">
									<xsl:with-param name="dateTimeIn" select="dgowh:DecisionDateTime"/>
								</xsl:call-template>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Принятое решение</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="dgowh:Decision" />
								<xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="dgowh:Decision='10'">
										<xsl:text>Разрешаю</xsl:text>
									</xsl:when>
									<xsl:when test="dgowh:Decision='11'">
										<xsl:text>Разрешаю под таможенным наблюдением</xsl:text>
									</xsl:when>
									<xsl:when test="dgowh:Decision='12'">
										<xsl:text>Разрешаю под таможенным наблюдением с составлением акта таможенного наблюдения</xsl:text>
									</xsl:when>
									<xsl:when test="dgowh:Decision='13'">
										<xsl:text>Отказ, с указанием причины</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="dgowh:Decision" />
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="dgowh:Reason">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Причина отказа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="dgowh:Reason" />
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="dgowh:CistomsPerson">
						<div class="title marg-top">Сведения о лице, принявшем решение </div>
						<div>
							<xsl:apply-templates select="dgowh:CistomsPerson">
								<xsl:with-param name="wdth" select="$w" />
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>

  <!-- Шаблон для типа RUScat_ru:RUAddressType -->
  <xsl:template match="dgowh:Address">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <xsl:if test="RUScat_ru:AddressKindCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Вид адреса</td>
            <td class="value graphMain" style="width:50%">
              <xsl:choose>
                <xsl:when test="RUScat_ru:AddressKindCode='1'">
                  <xsl:text>адрес регистрации</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='2'">
                  <xsl:text>фактический адрес</xsl:text>
                </xsl:when>
                <xsl:when test="RUScat_ru:AddressKindCode='3'">
                  <xsl:text>почтовый адрес</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="RUScat_ru:AddressKindCode" />
                </xsl:otherwise>
              </xsl:choose>
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostalCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Почтовый индекс</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostalCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CountryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Буквенный код страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CountryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CounryName">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Краткое название страны в соответствии с классификатором стран мира</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CounryName" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Region">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Регион (Наименование единицы административно-территориального деления первого уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Region" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:District">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Район (Наименование единицы административно-территориального деления второго уровня)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:District" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Town">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Город</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Town" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:City">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Населенный пункт</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:City" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:StreetHouse">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Улица (Наименование элемента улично-дорожной сети городской инфраструктуры)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:StreetHouse" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:House">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение дома, корпуса, строения</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:House" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:Room">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Обозначение офиса или квартиры</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:Room" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AddressText">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Набор элементов адреса, представленных в свободной форме в виде текста.</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AddressText" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKTMO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКТМО (Общероссийский классификатор территорий муниципальных образований)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKTMO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:OKATO">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код ОКАТО (Общероссийский классификатор объектов административно-территориального деления)</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:OKATO" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:KLADR">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код КЛАДР</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:KLADR" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOGUID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Глобальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOGUID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:AOID">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Уникальный идентификатор адресного объекта по ФИАС</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:AOID" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:TerritoryCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код единицы административно-территориального деления</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:TerritoryCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:PostOfficeBoxId">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер абонентского ящика на предприятии почтовой связи</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:PostOfficeBoxId" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="dgowh:AppGoodsOperNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
  <!-- Шаблон для типа RUScat_ru:CustomsPersonDetails -->
  <xsl:template match="dgowh:CistomsPerson">
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
      <xsl:if test="RUScat_ru:LNP">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:LNP" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="RUScat_ru:CustomsCode">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="RUScat_ru:CustomsCode" />
            </td>
          </tr>
        </table>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- Шаблон для типа dgowh:TransportDetailsType -->
  <xsl:template match="dgowh:TransportDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <tr>
        <td class="graphMain bordered">
          <xsl:apply-templates select="dgowh:TransportModeCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="dgowh:TransportIdentifier" />
        </td>
        <td class="graphMain bordered">
          <xsl:apply-templates select="dgowh:TransportMeansNationalityCode" />
        </td>
        <td class="graphMain bordered">
          <xsl:for-each select="dgowh:ContainerNumber">
            <xsl:if test="position()!=1">
              <br />
            </xsl:if>
            <xsl:apply-templates select="." />
          </xsl:for-each>
        </td>
      </tr>
    </div>
  </xsl:template>
  <!-- Шаблон для типа dgowh:WHDetailsType -->
  <xsl:template match="dgowh:WHDetails">
    <xsl:param name="wdth" select="0" />
    <xsl:variable name="w" select="$wdth - 5" />
    <div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
      <table>
        <tr>
          <td class="annot graphMain" style="width:50%">Код места нахождения товаров </td>
          <td class="value graphMain" style="width:50%">
            <xsl:apply-templates select="dgowh:WHCode" />
          </td>
        </tr>
      </table>
      <xsl:if test="dgowh:CertificateNumber">
        <table>
          <tr>
            <td class="annot graphMain" style="width:50%">Номер Свидетельства о включении в Реестр / Номер лицензии / Номер разрешения таможни на ОХ / Номер приказа о создании ЗТК</td>
            <td class="value graphMain" style="width:50%">
              <xsl:apply-templates select="dgowh:CertificateNumber" />
            </td>
          </tr>
        </table>
      </xsl:if>
      <xsl:if test="dgowh:Address">
        <div class="title marg-top">Адрес места нахождения товаров ЗТК/СВХ/иные места временного хранения товаров</div>
        <div>
          <xsl:apply-templates select="dgowh:Address">
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
	<xsl:template name="russian_date_gtd">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text></xsl:text>
				<xsl:value-of select="substring($dateIn,3,2)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*" mode="russian_date_gtd">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_gtd">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
  <xsl:template match="//*[local-name()='DecisionGoodsOperationWH']//*" priority="-1">
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
 	<xsl:template name="date_time">
		<xsl:param name="dateTimeIn"/>
		<xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="substring($dateTimeIn,1,10)"/>
		</xsl:call-template>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring($dateTimeIn,12,5)"/>
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