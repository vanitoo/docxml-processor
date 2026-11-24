<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ipap="urn:customs.ru:TROISIntellectualProperty:5.26.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0">
	<!-- Шаблон для типа TROISIntellectualPropertyType -->
	<xsl:template match="ipap:TROISIntellectualProperty">
		<xsl:param name="w" select="277"/>
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
                  padding: 5mm 5mm 5mm 5mm;
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
										<b>Государственная услуга по ведению таможенного реестра объектов интеллектуальной собственности</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tr>
							<td class="annot graphMain" style="width:50%">Согласие на обработку персональных данных: 0 - Нет, 1 - Да</td>
							<td class="value graphMain" style="width:50%">
								<xsl:choose>
									<xsl:when test="ipap:ProcessingPersonalData='true' or ipap:ProcessingPersonalData='1'">
										<xsl:text>ДА</xsl:text>
									</xsl:when>
									<xsl:when test="ipap:ProcessingPersonalData='false' or ipap:ProcessingPersonalData='0'">
										<xsl:text>НЕТ</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="ipap:ProcessingPersonalData"/>
									</xsl:otherwise>
								</xsl:choose>
							</td>
						</tr>
					</table>
					<xsl:if test="ipap:ApplicationSystemInfo">
						<div class="title marg-top">Системные данные из ЕПГУ</div>
						<div>
							<xsl:apply-templates select="ipap:ApplicationSystemInfo">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ipap:Service">
						<div class="title marg-top">Услуга</div>
						<div>
							<xsl:apply-templates select="ipap:Service">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ipap:Additionally">
						<div class="title marg-top">Доп. информация</div>
						<div>
							<xsl:apply-templates select="ipap:Additionally">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="ipap:InfoNumberAppsheets">
						<div class="title marg-top">Количество листов приложений</div>
						<div>
							<xsl:apply-templates select="ipap:InfoNumberAppsheets">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="organization">
		
	</xsl:template>
	
	<!-- Шаблон для типа ipap:AdditionalDataType -->
	<xsl:template match="ipap:AdditionalData">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип заявителя (из справочника "Типы заявителей")</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:UserType"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:OtherDocuments">
				<div class="title marg-top">Дополнительные документы</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Название документа</td>
							<td class="graphMain bordered">Номер документа</td>
							<td class="graphMain bordered">Дата документа</td>
							<td class="graphMain bordered">Ссылка на документ</td>
							<td class="graphMain bordered">Сведения о договоре страхования</td>
						</tr>
						<xsl:for-each select="ipap:OtherDocuments">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:AdditionallyType -->
	<xsl:template match="ipap:Additionally">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ipap:FIO">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:AddressType -->
	<xsl:template match="ipap:Address">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:FullAddress">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddress"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Index"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Region"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Area">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Area"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:CityArea">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Внутригородской район</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:CityArea"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Place">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Place"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Street">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Street"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalArea">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Доп. территория</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalArea"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalStreet">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица на доп. территории</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalStreet"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дом</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Building1">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Корпус</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Building1"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Building2">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Building2"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Apartment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер квартиры, офиса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Apartment"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalInformation">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация по адресу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalInformation"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ApplicantInfoType -->
	<xsl:template match="ipap:ApplicantInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип заявителя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:UserType"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:CountryRegInfo">
				<div class="title marg-top">Страна регистрации лица</div>
				<div>
					<xsl:apply-templates select="ipap:CountryRegInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:LegalEntity">
				<div class="title marg-top">Юридическое лицо</div>
				<div>
					<xsl:apply-templates select="ipap:LegalEntity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PhysicalPerson">
				<div class="title marg-top">Физическое лицо</div>
				<div>
					<xsl:apply-templates select="ipap:PhysicalPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:IP">
				<div class="title marg-top">Индивидуальный предприниматель</div>
				<div>
					<xsl:apply-templates select="ipap:IP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Заявитель является</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:RightHolderCheck"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Заявитель является доверенным лицом</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ipap:IsTrustee='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Confidence">
				<div class="title marg-top">Доверенность</div>
				<div>
					<xsl:apply-templates select="ipap:Confidence">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ApplicationInfoType -->
	<xsl:template match="ipap:ApplicationInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ApplicantInfo">
				<div class="title marg-top">Заявитель</div>
				<div>
					<xsl:apply-templates select="ipap:ApplicantInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:RegistryInclusion">
				<div class="title marg-top">Данные о включении объектов интеллектуальной собственности в таможенный реестр</div>
				<div>
					<xsl:apply-templates select="ipap:RegistryInclusion">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:RegistryCertificateChanging">
				<div class="title marg-top">Данные о внесении изменений в заявление или в таможенный реестр</div>
				<div>
					<xsl:apply-templates select="ipap:RegistryCertificateChanging">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:RegistryExclusion">
				<div class="title marg-top">Данные об исключении объекта интеллектуальной собственности из таможенного реестра</div>
				<div>
					<xsl:apply-templates select="ipap:RegistryExclusion">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:RegistryRenewal">
				<div class="title marg-top">Данные о продлении срока включения объекта интеллектуальной собственности в таможенный реестр</div>
				<div>
					<xsl:apply-templates select="ipap:RegistryRenewal">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ApplicationSystemInfoType -->
	<xsl:template match="ipap:ApplicationSystemInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код транзакции</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:TransactionCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код цели услуги</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ServiceCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор заявления на ЕПГУ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ApplicationSourceSystemID"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Department">
				<div class="title marg-top">Подразделение, в которое предоставляется заявка</div>
				<div>
					<xsl:apply-templates select="ipap:Department">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер заявления на АПС "Электронные Госуслуги"</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ApplicationID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата поступления запроса в АПС "Электронные Госуслуги"</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:CreationDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ArchDocType -->
	<xsl:template match="ipap:ArchDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">, </xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:ArchDoc">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><table><tr><td class="annot graphMain" style="width:50%">Идентификатор архива</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:ArchID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Идентификатор документа архива</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:ArchDocID" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><xsl:if test="ipap:TroisDoc" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Документ в соответствии со справочником документов ТРОИС</div><div><xsl:apply-templates select="ipap:TroisDoc"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if><xsl:if test="ipap:ChangeAction" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><table><tr><td class="annot graphMain" style="width:50%">Признак изменения: 0 - без изменений, 1 - изменение</td><td class="value graphMain" style="width:50%"><xsl:choose><xsl:when test="ipap:ChangeAction='0'"><xsl:text>без изменений</xsl:text></xsl:when><xsl:when test="ipap:ChangeAction='1'"><xsl:text>изменение</xsl:text></xsl:when><xsl:otherwise><xsl:value-of select="ipap:ChangeAction" /></xsl:otherwise></xsl:choose></td></tr></table></xsl:if></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:ConfidenceDetailsType -->
	<xsl:template match="ipap:Attorney">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ArchDocID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор документа архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchDocID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:TroisDoc">
				<div class="title marg-top">Документ в соответствии со справочником документов ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:TroisDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер доверенности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:LetterOfAttorneyNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата составления доверенности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:LetterOfAttorneyDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:DateUpTo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания срока действия доверенности</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:DateUpTo" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Indefinitely">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бессрочно</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:Indefinitely='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Доверитель</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Principal"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Доверенное лицо</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Agent"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:NotarizedDocumentInfo">
				<div class="title marg-top">Сведения о нотариальной доверенности</div>
				<div>
					<xsl:apply-templates select="ipap:NotarizedDocumentInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:CustomsTypeWithDescription -->
	<xsl:template match="ipap:BorderCustoms">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:OfficeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:PersonBaseType -->
	<xsl:template match="ipap:Chief">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Должность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonPost"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">СНИЛС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:SNILS"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:Chief">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><table><tr><td class="annot graphMain" style="width:50%">Должность</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonPost" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonSurname" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><xsl:if test="ipap:PersonMiddleName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><table><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonMiddleName" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonSnils" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:ConfidenceType -->
	<xsl:template match="ipap:Confidence">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Attorney">
				<div class="title marg-top">Доверенность</div>
				<div>
					<xsl:apply-templates select="ipap:Attorney">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Доверенность получена в порядке передоверия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ipap:Retrust='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:MajorAttorney">
				<div class="title marg-top">Основная доверенность, подтверждающая полномочия</div>
				<div>
					<xsl:apply-templates select="ipap:MajorAttorney">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ChangeAction">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак изменения: 0 - без изменений, 1 - изменение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:ChangeAction='0'">
									<xsl:text>без изменений</xsl:text>
								</xsl:when>
								<xsl:when test="ipap:ChangeAction='1'">
									<xsl:text>изменение</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ipap:ChangeAction"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ConsentDocumentInfoType -->
	<xsl:template match="ipap:ConsentDocument">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ArchID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ArchDocID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:TroisDoc">
						<xsl:apply-templates select="ipap:TroisDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Date" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Validity"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DateEnd" mode="russian_date"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ContactInformationType -->
	<xsl:template match="ipap:ContactInformation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Телефон</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ipap:Phone">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Fax">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Факс</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Fax"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Адрес электронной почты</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ipap:Email">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ProductDetailsType -->
	<xsl:template match="ipap:ControfactsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Mark">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Защитная маркировка и ее имитация</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Mark"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Codes">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Штрихкоды</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Codes"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Color">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Цвет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Color"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Article">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Артикулы, знаки сертификации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Article"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Labels">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ярлыки</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Labels"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Holograms">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Голограммы</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Holograms"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание товаров</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:LoadCustoms">
				<div class="title marg-top">Сведения о местах перегрузки</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:LoadCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:StoreCustoms">
				<div class="title marg-top">Сведения о местах хранения</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:StoreCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:BorderCustoms">
				<div class="title marg-top">Сведения о местах пересечения таможенной границы ЕАЭС</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:BorderCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ControlCustoms">
				<div class="title marg-top">Сведения о местах совершения таможенных операций и проведения таможенного контроля</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:ControlCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:PackCount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о количестве товаров в упаковке</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PackCount"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Pallets">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об использовании паллет, поддонов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Pallets"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Pack">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о виде упаковки, материале, цвете, форме</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Pack"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Idents">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об идентификационных номерах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Idents"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Protects">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об имитации защитной̆ маркировки, штрих-кодов, изображений и схем</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Protects"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Docs">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о документах, сопровождающих товары</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Docs"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Uniques">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об отличительных особенностях документов, сопровождающих товары</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Uniques"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Other">
				<div class="title marg-top">Иные сведения</div>
				<div>
					<xsl:apply-templates select="ipap:Other">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:CustomsTypeWithDescription -->
	<xsl:template match="ipap:ControlCustoms">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:OfficeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:CountryInfoType -->
	<xsl:template match="ipap:CountryRegInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа ipap:CustomsType -->
	<xsl:template match="ipap:Department">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OfficeName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Code"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:DescriptionArchType -->
	<xsl:template match="ipap:Description">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Описание</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Description"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ArchDoc">
				<div class="title marg-top">Ссылка на документ</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Идентификатор архива</td>
							<td class="graphMain bordered">Идентификатор документа архива</td>
							<td class="graphMain bordered">Документ в соответствии со справочником документов ТРОИС</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение</td>
						</tr>
						<xsl:for-each select="ipap:ArchDoc">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:DocumentInfoType -->
	<xsl:template match="ipap:DocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Название документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Document"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DocumentsNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DocumentsDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ArchDoc">
				<div class="title marg-top">Ссылка на документ</div>
				<div>
					<xsl:apply-templates select="ipap:ArchDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:DocInfoType -->
	<xsl:template match="ipap:ExpropriationInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DocNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DocDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ContractInfo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Суть договора</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ContractInfo"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ArchDoc">
				<div class="title marg-top">Ссылка на документ</div>
				<div>
					<xsl:apply-templates select="ipap:ArchDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:IPPersonType -->
	<xsl:template match="ipap:IP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">СНИЛС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:SNILS"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРНИП. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OGRNIP"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:IdentityCard">
				<div class="title marg-top">Данные документа, удостоверяющего личность</div>
				<div>
					<xsl:apply-templates select="ipap:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:IdentityCardType -->
	<xsl:template match="ipap:IdentityCard">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Тип документа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:IdentityCardType"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код вида документа, удостоверяющего личность (для РФ)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:IdentityCardCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Серия документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:IdentityCardSeries"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:IdentityCardNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата выдачи документа, удостоверяющего личность</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:IdentityCardDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации, выдавшей документ</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OrganizationName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ArchID"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор документа архива</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ArchDocID"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:TroisDoc">
				<div class="title marg-top">Документ в соответствии со справочником документов ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:TroisDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ImporterType -->
	<xsl:template match="ipap:Importer">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Role">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RoleOther"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderLegalEntity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderIP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPersonForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderOrganizationForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ImporterInfoType -->
	<xsl:template match="ipap:ImporterInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Role">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RoleOther"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Volume">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:LicenseInfo">
						<xsl:apply-templates select="ipap:LicenseInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:VolumeOther"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:CountryRegInfo">
						<xsl:apply-templates select="ipap:CountryRegInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderLegalEntity" mode="organization"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPerson" mode="organization">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderIP" mode="organization">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPersonForeign" mode="organization">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderOrganizationForeign" mode="organization">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ConsentDocument">
						<xsl:apply-templates select="ipap:ConsentDocument">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:Restrictions">
						<xsl:apply-templates select="ipap:Restrictions">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:InfoNumberAppsheetsType -->
	<xsl:template match="ipap:InfoNumberAppsheets">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:NShGroundsSubmittingApp">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов сведений об основаниях для подачи заявления</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShGroundsSubmittingApp" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShCommitment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов обязательства</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShCommitment" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShCopyrightHolder">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов сведений о правообладателе (его представителе (при наличии))</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShCopyrightHolder" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShIntellectualProperty">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов сведений об объекте интеллектуальной собственности</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShIntellectualProperty" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShGoods">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов сведений о товарах, ввоз в РФ, вывоз из РФ или совершение с которыми иных действий во время их нахождения под таможенным контролем, влечет нарушение прав правообладателя на ОИС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShGoods" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShPeriod">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов сведений о сроке, в течение которого потребуется участие таможенных органов в защите прав на ОИС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShPeriod" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShDocIPO">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов документов, подтверждающих наличие прав на ОИС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShDocIPO" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShConfidenceInfo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов документов, подтверждающих полномочия представителя</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShConfidenceInfo" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShDocInfoApp">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов документов, подтверждающих сведения, указанные в заявлении</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShDocInfoApp" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:NShDocOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Количество листов иных документов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:NShDocOther" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:DescrDocOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Перечень наименований иных документов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:DescrDocOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:InfoTrademarkType -->
	<xsl:template match="ipap:InfoTrademark">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:MainInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ProductInfo">
						<xsl:apply-templates select="ipap:ProductInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ControfactsInfo">
						<xsl:apply-templates select="ipap:ControfactsInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:InsuranceContractInfoType -->
	<xsl:template match="ipap:InsuranceContract">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ArchID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ArchDocID"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:TroisDoc">
						<xsl:apply-templates select="ipap:TroisDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:NumInsur"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Insurance01"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:INN01"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Insurance02"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:INN02"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Insurance03"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:INN03"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:InsurancePremium='true'">
							<xsl:text>есть</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>нет</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Summ" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Currency"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DateInsur" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DateOffInsur" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:InsuranceContractInfoType -->
	<xsl:template match="ipap:InsuranceContractInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ArchDocID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор документа архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchDocID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:TroisDoc">
				<div class="title marg-top">Документ в соответствии со справочником документов ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:TroisDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер договора страхования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:NumInsur"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Страховщик</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Insurance01"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN01"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Страхователь</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Insurance02"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN02"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Застрахованное лицо</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Insurance03"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:INN03">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:INN03"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:InsurancePremium">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Страховая премия уплачена</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:InsurancePremium='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Summ">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сумма страхования</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Summ" mode="translate_number"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Currency">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Валюта страхования</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Currency"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата заключения договора страхования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DateInsur" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата окончания договора страхования</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DateOffInsur" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ChangeAction">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак изменения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:ChangeAction='0'">
									<xsl:text>без изменений</xsl:text>
								</xsl:when>
								<xsl:when test="ipap:ChangeAction='1'">
									<xsl:text>изменение</xsl:text>
								</xsl:when>
								<xsl:when test="ipap:ChangeAction='2'">
									<xsl:text>добавление</xsl:text>
								</xsl:when>
								<xsl:when test="ipap:ChangeAction='3'">
									<xsl:text>исключение</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ipap:ChangeAction"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:LegalEntityType -->
	<xsl:template match="ipap:LegalEntity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:OPF">
				<div class="title marg-top">Организационно-правовая форма</div>
				<div>
					<xsl:apply-templates select="ipap:OPF">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OrganizationName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OGRN"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Chief">
				<div class="title marg-top">Сведения о руководителе</div>
				<div>
					<xsl:apply-templates select="ipap:Chief">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:LicenseInfoType -->
	<xsl:template match="ipap:LicenseInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Document"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:LicenseNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:LicenseDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:CustomsTypeWithDescription -->
	<xsl:template match="ipap:LoadCustoms">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:OfficeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:MainInfoType -->
	<xsl:template match="ipap:MainInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ProductClass">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Класс по МКТУ</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ProductClass"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Коды товаров по ТН ВЭД</td>
					<td class="graphMain value" style="width:50%">
						<xsl:for-each select="ipap:ProductCodes">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование товара, в отношении которого охраняется ОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ProductList"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ConfidenceDetailsType -->
	<xsl:template match="ipap:MajorAttorney">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ArchDocID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор документа архива</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ArchDocID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:TroisDoc">
				<div class="title marg-top">Документ в соответствии со справочником документов ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:TroisDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер доверенности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:LetterOfAttorneyNumber"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата составления доверенности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:LetterOfAttorneyDate" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:DateUpTo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата окончания срока действия доверенности</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:DateUpTo" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Indefinitely">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бессрочно</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:Indefinitely='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Доверитель</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Principal"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Доверенное лицо</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Agent"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:NotarizedDocumentInfo">
				<div class="title marg-top">Сведения о нотариальной доверенности</div>
				<div>
					<xsl:apply-templates select="ipap:NotarizedDocumentInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:NotarizedDocumentInfoType -->
	<xsl:template match="ipap:NotarizedDocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер (по журналу учета)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:RegistrationNum"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Notary">
				<div class="title marg-top">Нотариус/И.О. нотариуса</div>
				<div>
					<xsl:apply-templates select="ipap:Notary">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:NotarizedDocumentNum">
				<div class="title marg-top">Данные нотариального бланка</div>
				<div>
					<xsl:apply-templates select="ipap:NotarizedDocumentNum">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:NotarizedDocumentNumType -->
	<xsl:template match="ipap:NotarizedDocumentNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Идентификатор</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Identifier"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Серия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Series"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Number"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:PersonSimpleType -->
	<xsl:template match="ipap:Notary">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:OISInfoType -->
	<xsl:template match="ipap:OISInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Period">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок принятия мер таможенным органом</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Period" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObjectType">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Вид объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ObjectType"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObjectInfoTZ">
				<div class="title marg-top">Товарный знак</div>
				<div>
					<xsl:apply-templates select="ipap:ObjectInfoTZ">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ObjectInfoNMPT">
				<div class="title marg-top">Наименование места происхождения товара</div>
				<div>
					<xsl:apply-templates select="ipap:ObjectInfoNMPT">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ObjectInfoOAP">
				<div class="title marg-top">Объект авторского права</div>
				<div>
					<xsl:apply-templates select="ipap:ObjectInfoOAP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ObjectInfoOSP">
				<div class="title marg-top">Объект смежного права</div>
				<div>
					<xsl:apply-templates select="ipap:ObjectInfoOSP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ChangeAction">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Признак изменения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:ChangeAction='0'">
									<xsl:text>без изменений</xsl:text>
								</xsl:when>
								<xsl:when test="ipap:ChangeAction='1'">
									<xsl:text>изменение</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="ipap:ChangeAction"/>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:OPFType -->
	<xsl:template match="ipap:OPF">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<!--div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"-->
			<xsl:for-each select="*">
				<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		<!--/div-->
	</xsl:template>
	<!-- Шаблон для типа ipap:ObjectInfoNMPTType -->
	<xsl:template match="ipap:ObjectInfoNMPT">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование места происхождения товара</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:NMPT"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание ОИС</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Срок охраноспособности</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Period" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<div class="title marg-top">Сведения о документах, подтверждающих регистрацию и предоставление права пользования наименованием места происхождения товара в соответствии с Законодательством РФ</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Документ</td>
						<td class="graphMain bordered">Номер</td>
						<td class="graphMain bordered">Дата</td>
						<td class="graphMain bordered">Ссылка на документ</td>
					</tr>
					<xsl:for-each select="ipap:RegistrationNMPTInfo">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ObjectInfoOAPType -->
	<xsl:template match="ipap:ObjectInfoOAP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование объекта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ObjectName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Форма произведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Form"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:FormOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Иная форма произведения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FormOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид произведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ModeProd"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ModeOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Иной вид произведения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ModeOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObjectDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ObjectDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание ОИС</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата создания ОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DateCreation" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:RightDocumentInfo">
				<div class="title marg-top">Сведения о документе, подтверждающем наличие прав</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Документ</td>
							<td class="graphMain bordered">Номер</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Суть документа</td>
							<td class="graphMain bordered">Ссылка на документ</td>
						</tr>
						<xsl:for-each select="ipap:RightDocumentInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:RightTransferDocumentInfo">
				<div class="title marg-top">Сведения о документе на передачу прав</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Документ</td>
							<td class="graphMain bordered">Номер</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Суть документа</td>
							<td class="graphMain bordered">Ссылка на документ</td>
						</tr>
						<xsl:for-each select="ipap:RightTransferDocumentInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ObjectInfoOAPType -->
	<xsl:template match="ipap:ObjectInfoOSP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование объекта</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ObjectName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Форма произведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Form"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:FormOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Иная форма произведения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FormOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид произведения</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ModeProd"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ModeOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Иной вид произведения</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ModeOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObjectDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Описание объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ObjectDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание ОИС</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Дата создания ОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:DateCreation" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:RightDocumentInfo">
				<div class="title marg-top">Сведения о документе, подтверждающем наличие прав</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Документ</td>
							<td class="graphMain bordered">Номер</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Суть документа</td>
							<td class="graphMain bordered">Ссылка на документ</td>
						</tr>
						<xsl:for-each select="ipap:RightDocumentInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:RightTransferDocumentInfo">
				<div class="title marg-top">Сведения о документе на передачу прав</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Документ</td>
							<td class="graphMain bordered">Номер</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Суть документа</td>
							<td class="graphMain bordered">Ссылка на документ</td>
						</tr>
						<xsl:for-each select="ipap:RightTransferDocumentInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ObjectInfoTZType -->
	<xsl:template match="ipap:ObjectInfoTZ">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид товарного знака</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Mode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ModeOther">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Иной вид товарного знака</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ModeOther"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование товарного знака (знаков обслуживания)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:TZName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ObjectsDescription">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Варианты словесного написания объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ObjectsDescription"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание ОИС</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ColorCombination">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Цветовое сочетание объекта</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ColorCombination"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:UnguardedElement">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Неохраняемые элементы</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:UnguardedElement"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Period">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Срок охраноспособности товарного знака</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Period" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Indefinitely">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Бессрочно</td>
						<td class="value graphMain" style="width:50%">
							<xsl:choose>
								<xsl:when test="ipap:Indefinitely='true'">
									<xsl:text>есть</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:text>нет</xsl:text>
								</xsl:otherwise>
							</xsl:choose>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:DocumentInfo">
				<div class="title marg-top">Сведения о документе, подтверждающем регистрацию товарного знака (знака обслуживания) в соответствии с Законодательством РФ и международными договорами РФ</div>
				<div>
					<xsl:apply-templates select="ipap:DocumentInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ExpropriationInfo">
				<div class="title marg-top">Сведения о договоре на отчуждение исключительного права</div>
				<div>
					<xsl:apply-templates select="ipap:ExpropriationInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PrerogativeInfo">
				<div class="title marg-top">Cведения о переходе исключительного права на товарный знак без договора</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Номер регистрации перехода</td>
							<td class="graphMain bordered">Дата</td>
							<td class="graphMain bordered">Описание</td>
							<td class="graphMain bordered">Ссылка на документ</td>
						</tr>
						<xsl:for-each select="ipap:PrerogativeInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ObligationType -->
	<xsl:template match="ipap:Obligation">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Правообладатель(и) принимает(ют) на себя обязательства по возмещению вреда</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="ipap:RightholderObligation='true'">
								<xsl:text>есть</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>нет</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ArchDoc">
				<div class="title marg-top">Ссылка на документ</div>
				<div>
					<xsl:apply-templates select="ipap:ArchDoc">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ObligationsInfoType -->
	<xsl:template match="ipap:ObligationsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Obligation">
				<div class="title marg-top">Обязательство</div>
				<div>
					<xsl:apply-templates select="ipap:Obligation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:InsuranceContract">
				<div class="title marg-top">Договор страхования</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Идентификатор архива</td>
							<td class="graphMain bordered">Идентификатор документа архива</td>
							<td class="graphMain bordered">Документ в соответствии со справочником документов ТРОИС</td>
							<td class="graphMain bordered">Номер договора страхования</td>
							<td class="graphMain bordered">Страховщик</td>
							<td class="graphMain bordered">ИНН</td>
							<td class="graphMain bordered">Страхователь</td>
							<td class="graphMain bordered">ИНН</td>
							<td class="graphMain bordered">Застрахованное лицо</td>
							<td class="graphMain bordered">ИНН</td>
							<td class="graphMain bordered">Страховая премия уплачена</td>
							<td class="graphMain bordered">Сумма страхования</td>
							<td class="graphMain bordered">Валюта страхования</td>
							<td class="graphMain bordered">Дата заключения договора страхования</td>
							<td class="graphMain bordered">Дата окончания договора страхования</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<xsl:for-each select="ipap:InsuranceContract">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:DescriptionArchType -->
	<xsl:template match="ipap:Other">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Описание</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Description"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ArchDoc">
				<div class="title marg-top">Ссылка на документ</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Идентификатор архива</td>
							<td class="graphMain bordered">Идентификатор документа архива</td>
							<td class="graphMain bordered">Документ в соответствии со справочником документов ТРОИС</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение</td>
						</tr>
						<xsl:for-each select="ipap:ArchDoc">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:OtherDocumentInfoType -->
	<xsl:template match="ipap:OtherDocuments">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Document"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DocumentsNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DocumentsDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:InsuranceContractInfo">
						<xsl:apply-templates select="ipap:InsuranceContractInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:PhysicalPersonType -->
	<xsl:template match="ipap:PhysicalPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">СНИЛС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:SNILS"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:IdentityCard">
				<div class="title marg-top">Данные документа, удостоверяющего личность</div>
				<div>
					<xsl:apply-templates select="ipap:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:AddressType -->
	<xsl:template match="ipap:PostalAddress">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:FullAddress">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddress"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Почтовый индекс</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Index"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Область (регион, штат, провинция и т.п.)</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:Region"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Area">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Район</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Area"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:City">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Город</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:City"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:CityArea">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Внутригородской район</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:CityArea"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Place">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Населенный пункт</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Place"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Street">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Street"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalArea">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Доп. территория</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalArea"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalStreet">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Улица на доп. территории</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalStreet"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:House">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дом</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:House"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Building1">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Корпус</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Building1"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Building2">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Строение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Building2"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Apartment">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Номер квартиры, офиса</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Apartment"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:AdditionalInformation">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дополнительная информация по адресу</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:AdditionalInformation"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:PrerogativeInfoType -->
	<xsl:template match="ipap:PrerogativeInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RegistrationNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RegistrationDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description" mode="null"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:ProductDetailsType -->
	<xsl:template match="ipap:ProductInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Mark">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Защитная маркировка и ее имитация</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Mark"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Codes">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Штрихкоды</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Codes"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Color">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Цвет</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Color"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Article">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Артикулы, знаки сертификации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Article"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Labels">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Ярлыки</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Labels"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Holograms">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Голограммы</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Holograms"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Description">
				<div class="title marg-top">Описание товаров</div>
				<div>
					<xsl:apply-templates select="ipap:Description">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:LoadCustoms">
				<div class="title marg-top">Сведения о местах перегрузки</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:LoadCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:StoreCustoms">
				<div class="title marg-top">Сведения о местах хранения</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:StoreCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:BorderCustoms">
				<div class="title marg-top">Сведения о местах пересечения таможенной границы ЕАЭС</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:BorderCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ControlCustoms">
				<div class="title marg-top">Сведения о местах совершения таможенных операций и проведения таможенного контроля</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование таможенного органа</td>
							<td class="graphMain bordered">Код таможенного органа</td>
							<td class="graphMain bordered">Описание места</td>
						</tr>
						<xsl:for-each select="ipap:ControlCustoms">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:PackCount">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о количестве товаров в упаковке</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PackCount"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Pallets">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об использовании паллет, поддонов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Pallets"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Pack">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о виде упаковки, материале, цвете, форме</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Pack"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Idents">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об идентификационных номерах</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Idents"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Protects">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об имитации защитной̆ маркировки, штрих-кодов, изображений и схем</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Protects"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Docs">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о документах, сопровождающих товары</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Docs"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Uniques">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения об отличительных особенностях документов, сопровождающих товары</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:Uniques"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:Other">
				<div class="title marg-top">Иные сведения</div>
				<div>
					<xsl:apply-templates select="ipap:Other">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:ProductInfo">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><div class="title marg-top">Товар</div><table class="bordered"><tbody><tr class="title"><td class="graphMain bordered">Основная информация о товарах</td><td class="graphMain bordered">Дополнительная информация об оригинальных товарах</td><td class="graphMain bordered">Сведения о товарах (с признаками контрафактных)</td><td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td></tr><xsl:for-each select="ipap:InfoTrademark" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:apply-templates select="."><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></xsl:for-each></tbody></table></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:ProductOrganizationsInfoType -->
	<xsl:template match="ipap:ProductOrganizationsInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:Importer">
				<div class="title marg-top">Лица, осуществляющие оборот товаров с признаками контрафактных</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Роль лица</td>
							<td class="graphMain bordered">Иная роль лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Иностранное лицо (ФЛ)</td>
							<td class="graphMain bordered">Иностранное лицо (ЮЛ)</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<xsl:for-each select="ipap:Importer">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RegistrationNMPTInfoType -->
	<xsl:template match="ipap:RegistrationNMPTInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Document"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Date" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RegistryInfoChangingType -->
	<xsl:template match="ipap:RegistryCertificateChanging">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ОИС по ТРОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OISRegNum"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ApplicationRegNumber">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Регистрационный номер заявления на включение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ApplicationRegNumber"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ApplicationDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата заявления на включение</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:ApplicationDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Краткое описание необходимых изменений</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:BriefChanges"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:RightHoldersInfo">
				<div class="title marg-top">Правообладатели</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование правообладателя</td>
							<td class="graphMain bordered">Страна регистрации лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Иностранное лицо (ФЛ)</td>
							<td class="graphMain bordered">Иностранное лицо (ЮЛ)</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<xsl:for-each select="ipap:RightHoldersInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObligationsInfo">
				<div class="title marg-top">Обязательства</div>
				<div>
					<xsl:apply-templates select="ipap:ObligationsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:OISInfo">
				<div class="title marg-top">ОИС, который необходимо изменить</div>
				<div>
					<xsl:apply-templates select="ipap:OISInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ProductInfo">
				<div class="title marg-top">Товары</div>
				<div>
					<xsl:apply-templates select="ipap:ProductInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ProductOrganizationsInfo">
				<div class="title marg-top">Лица, осуществляющие оборот товаров с признаками контрафактных</div>
				<div>
					<xsl:apply-templates select="ipap:ProductOrganizationsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:TrustedInfo">
				<div class="title marg-top">Доверенные лица</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Страна регистрации лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Доверенность</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<xsl:for-each select="ipap:TrustedInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ImporterInfo">
				<div class="title marg-top">Организации, имеющие согласие правообладателя</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Роль лица</td>
							<td class="graphMain bordered">Иная роль лица</td>
							<td class="graphMain bordered">Объем полномочий лица</td>
							<td class="graphMain bordered">Cведения о лицензионных (сублицензионных) договорах и договорах коммерческой концессии (субконцессии)</td>
							<td class="graphMain bordered">Иной объем полномочий лица</td>
							<td class="graphMain bordered">Страна регистрации лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Иностранное лицо (ФЛ)</td>
							<td class="graphMain bordered">Иностранное лицо (ЮЛ)</td>
							<td class="graphMain bordered">Документ, подтверждающий согласие правообладателя на использования ОИС</td>
							<td class="graphMain bordered">Ограничение</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<!--xsl:for-each select="ipap:ImporterInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each-->
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	
	<xsl:template match="*" mode="organization">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<br/>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа ipap:RegistryExclusionType -->
	<xsl:template match="ipap:RegistryExclusion">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:OISInfo">
				<div class="title marg-top">ОИС, который необходимо исключить из ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:OISInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ОИС по ТРОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OISRegNum"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Причина исключения ОИС из ТРОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ExclusionReason"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RegistryInclusionType -->
	<xsl:template match="ipap:RegistryInclusion">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:RightHoldersInfo">
				<div class="title marg-top">Правообладатели</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Наименование правообладателя</td>
							<td class="graphMain bordered">Страна регистрации лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Иностранное лицо (ФЛ)</td>
							<td class="graphMain bordered">Иностранное лицо (ЮЛ)</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<xsl:for-each select="ipap:RightHoldersInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each>
					</tbody>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ObligationsInfo">
				<div class="title marg-top">Обязательства</div>
				<div>
					<xsl:apply-templates select="ipap:ObligationsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:OISInfo">
				<div class="title marg-top">ОИС, который необходимо включить в ТРОИС</div>
				<div>
					<xsl:apply-templates select="ipap:OISInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ProductInfo">
				<div class="title marg-top">Товары</div>
				<div>
					<xsl:apply-templates select="ipap:ProductInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ProductOrganizationsInfo">
				<div class="title marg-top">Лица, осуществляющие оборот товаров с признаками контрафактных</div>
				<div>
					<xsl:apply-templates select="ipap:ProductOrganizationsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<div class="title marg-top">Доверенные лица</div>
			<table class="bordered">
				<tbody>
					<tr class="title">
						<td class="graphMain bordered">Страна регистрации лица</td>
						<td class="graphMain bordered">Юридическое лицо</td>
						<td class="graphMain bordered">Физическое лицо</td>
						<td class="graphMain bordered">Индивидуальный предприниматель</td>
						<td class="graphMain bordered">Доверенность</td>
						<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
					</tr>
					<xsl:for-each select="ipap:TrustedInfo">
						<xsl:apply-templates select=".">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:for-each>
				</tbody>
			</table>
			<xsl:if test="ipap:ImporterInfo">
				<div class="title marg-top">Организации, имеющие согласие правообладателя</div>
				<table class="bordered">
					<tbody>
						<tr class="title">
							<td class="graphMain bordered">Роль лица</td>
							<td class="graphMain bordered">Иная роль лица</td>
							<td class="graphMain bordered">Объем полномочий лица</td>
							<td class="graphMain bordered">Cведения о лицензионных (сублицензионных) договорах и договорах коммерческой концессии (субконцессии)</td>
							<td class="graphMain bordered">Иной объем полномочий лица</td>
							<td class="graphMain bordered">Страна регистрации лица</td>
							<td class="graphMain bordered">Юридическое лицо</td>
							<td class="graphMain bordered">Физическое лицо</td>
							<td class="graphMain bordered">Индивидуальный предприниматель</td>
							<td class="graphMain bordered">Иностранное лицо (ФЛ)</td>
							<td class="graphMain bordered">Иностранное лицо (ЮЛ)</td>
							<td class="graphMain bordered">Документ, подтверждающий согласие правообладателя на использования ОИС</td>
							<td class="graphMain bordered">Ограничение</td>
							<td class="graphMain bordered">Признак изменения: 0 - без изменений, 1 - изменение, 2 - добавление, 3 - исключение</td>
						</tr>
						<!--xsl:for-each select="ipap:ImporterInfo">
							<xsl:apply-templates select=".">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</xsl:for-each-->
					</tbody>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RegistryRenewalType -->
	<xsl:template match="ipap:RegistryRenewal">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:ObligationsInfo">
				<div class="title marg-top">Обязательства</div>
				<div>
					<xsl:apply-templates select="ipap:ObligationsInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:OISInfo">
				<div class="title marg-top">ОИС, срок включения которого необходимо продлить</div>
				<div>
					<xsl:apply-templates select="ipap:OISInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Регистрационный номер ОИС по ТРОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OISRegNum"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Срок продления</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:RenewalTerm" mode="russian_date"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Основания для продления срока включения ОИС из ТРОИС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:RenewalReason"/>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RestrictionsType -->
	<xsl:template match="ipap:Restrictions">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ModeRestrictions"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ModeOther"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ProcedureCode"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:ProcedureName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RightDocumentInfoType -->
	<xsl:template match="ipap:RightDocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Document"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Date" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DocumentInfo"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:FreeRightHolderIPPersonType -->
	<xsl:template match="ipap:RightHolderIP">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:SNILS">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">СНИЛС</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:SNILS"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:INN">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ИНН</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:INN"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:OGRNIP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ОГРНИП. Основной государственный регистрационный номер</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:OGRNIP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:IdentityCard">
				<div class="title marg-top">Данные документа, удостоверяющего личность</div>
				<div>
					<xsl:apply-templates select="ipap:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RightHolderLegalEntityType -->
	<xsl:template match="ipap:RightHolderLegalEntity">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:OPF">
				<div class="title marg-top">Организационно-правовая форма</div>
				<div>
					<xsl:apply-templates select="ipap:OPF">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование организации</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OrganizationName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН - Индивидуальный номер налогоплательщика</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ОГРН. Основной государственный регистрационный номер</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:OGRN"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Chief">
				<div class="title marg-top">Сведения о руководителе</div>
				<div>
					<xsl:apply-templates select="ipap:Chief">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:FreeRightHolderOrganizationForeignType -->
	<xsl:template match="ipap:RightHolderOrganizationForeign">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="ipap:OpfRus">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Организационно-правовая форма на кириллице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:OpfRus"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование на кириллице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:FullNameRus"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:OpfForeign">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Организационно-правовая форма на латинице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:OpfForeign"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Наименование на латинице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:FullNameForeign"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:FullAddressLat">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес на латинице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddressLat"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:FullAddress">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес на кириллице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddress"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:RegistrationInfo">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Сведения о регистрации организации в стране инкорпорации</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:RegistrationInfo"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:RightHolderOrganizationForeign">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><table><tr><td class="annot graphMain" style="width:50%">Организационно-правовая форма на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:OpfRus" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Наименование на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullNameRus" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Организационно-правовая форма на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:OpfForeign" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Наименование на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullNameForeign" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Адрес на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullAddressLat" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Адрес на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullAddress" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Сведения о регистрации организации в стране инкорпорации</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:RegistrationInfo" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><xsl:if test="ipap:ContactInformation" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Контактная информация</div><div><xsl:apply-templates select="ipap:ContactInformation"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:RightHolderPhysicalPersonType -->
	<xsl:template match="ipap:RightHolderPhysicalPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">СНИЛС</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSnils"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:PersonMiddleName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Отчество</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:PersonMiddleName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ИНН заявителя-физлица</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:INN"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:IdentityCard">
				<div class="title marg-top">Данные документа, удостоверяющего личность</div>
				<div>
					<xsl:apply-templates select="ipap:IdentityCard">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:Address">
				<div class="title marg-top">Адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:Address">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:PostalAddress">
				<div class="title marg-top">Почтовый адрес организации / физического лица</div>
				<div>
					<xsl:apply-templates select="ipap:PostalAddress">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:RightHolderPhysicalPerson">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><xsl:if test="ipap:SNILS" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><table><tr><td class="annot graphMain" style="width:50%">СНИЛС</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:SNILS" /></td></tr></table></xsl:if><table><tr><td class="annot graphMain" style="width:50%">Фамилия</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonSurname" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Имя</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><xsl:if test="ipap:PersonMiddleName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><table><tr><td class="annot graphMain" style="width:50%">Отчество</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonMiddleName" /></td></tr></table></xsl:if><xsl:if test="ipap:INN" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><table><tr><td class="annot graphMain" style="width:50%">ИНН заявителя-физлица</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:INN" /></td></tr></table></xsl:if><xsl:if test="ipap:IdentityCard" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Данные документа, удостоверяющего личность</div><div><xsl:apply-templates select="ipap:IdentityCard"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if><xsl:if test="ipap:Address" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Адрес организации / физического лица</div><div><xsl:apply-templates select="ipap:Address"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if><xsl:if test="ipap:PostalAddress" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Почтовый адрес организации / физического лица</div><div><xsl:apply-templates select="ipap:PostalAddress"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if><xsl:if test="ipap:ContactInformation" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Контактная информация</div><div><xsl:apply-templates select="ipap:ContactInformation"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:FreeRightHolderPhysicalPersonForeignType -->
	<xsl:template match="ipap:RightHolderPhysicalPersonForeign">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия на кириллице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurname"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Полное имя на кириллице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:FullName"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Фамилия на латинице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:PersonSurnameForeign"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Имя на латинице</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:FullNameForeign"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:FullAddress">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес на кириллице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddress"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:FullAddressLat">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Адрес на латинице</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="ipap:FullAddressLat"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="ipap:ContactInformation">
				<div class="title marg-top">Контактная информация</div>
				<div>
					<xsl:apply-templates select="ipap:ContactInformation">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон с дублирующимся match закомментирован -->
	<!--
<xsl:template match="ipap:RightHolderPhysicalPersonForeign">
<xsl:param name="wdth" select="0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><xsl:variable name="w" select="$wdth - 5" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /><div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;"><table><tr><td class="annot graphMain" style="width:50%">Фамилия на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonSurname" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Полное имя на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullName" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Фамилия на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:PersonSurnameForeign" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Имя на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullNameForeign" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Адрес на кириллице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullAddress" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><table><tr><td class="annot graphMain" style="width:50%">Адрес на латинице</td><td class="value graphMain" style="width:50%"><xsl:apply-templates select="ipap:FullAddressLat" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" /></td></tr></table><xsl:if test="ipap:ContactInformation" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><div class="title marg-top">Контактная информация</div><div><xsl:apply-templates select="ipap:ContactInformation"><xsl:with-param name="wdth" select="$w" /></xsl:apply-templates></div></xsl:if></div></xsl:template>
-->
	<!-- Шаблон для типа ipap:RightHolderType -->
	<xsl:template match="ipap:RightHoldersInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:CountryRegInfo">
						<xsl:apply-templates select="ipap:CountryRegInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderLegalEntity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderIP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderPhysicalPersonForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:RightHolderOrganizationForeign">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RightDocumentInfoType -->
	<xsl:template match="ipap:RightTransferDocumentInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Document"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Date" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:DocumentInfo"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="ipap:ArchDoc">
						<xsl:apply-templates select="ipap:ArchDoc">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:RoleType -->
	<xsl:template match="ipap:Role">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа ipap:ServiceType -->
	<xsl:template match="ipap:Service">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код цели услуги</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:ServiceCode"/>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Номер заявки в информационной системе отправителя</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="ipap:CaseNumber"/>
					</td>
				</tr>
			</table>
			<xsl:if test="ipap:ApplicationInfo">
				<div class="title marg-top">Общая информация о заявлении</div>
				<div>
					<xsl:apply-templates select="ipap:ApplicationInfo">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<xsl:if test="ipap:AdditionalData">
				<div class="title marg-top">Дополнительная информация от пользователя</div>
				<div>
					<xsl:apply-templates select="ipap:AdditionalData">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:CustomsTypeWithDescription -->
	<xsl:template match="ipap:StoreCustoms">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:OfficeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Code"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Description"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:TroisDocType -->
	<xsl:template match="ipap:TroisDoc">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<!-- Шаблон для типа ipap:TrustedInfoType -->
	<xsl:template match="ipap:TrustedInfo">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:if test="ipap:CountryRegInfo">
						<xsl:apply-templates select="ipap:CountryRegInfo">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:LegalEntity">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:PhysicalPerson">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:IP">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="ipap:Confidence">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="ipap:ChangeAction='0'">
							<xsl:text>без изменений</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='1'">
							<xsl:text>изменение</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='2'">
							<xsl:text>добавление</xsl:text>
						</xsl:when>
						<xsl:when test="ipap:ChangeAction='3'">
							<xsl:text>исключение</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="ipap:ChangeAction"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа ipap:VolumeType -->
	<xsl:template match="ipap:Volume">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='TROISIntellectualProperty']//*" priority="-1">
		<xsl:variable name="xpath">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="current()"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath}">
			<xsl:apply-templates/>
		</element>
	</xsl:template>
	<xsl:template name="get_xpath">
		<xsl:param name="node" select="."/>
		<xsl:variable name="xpath">
			<xsl:for-each select="$node/ancestor-or-self::*">
				<xsl:variable name="name">
					<xsl:value-of select="name()"/>
				</xsl:variable>
				<xsl:variable name="pos">
					<xsl:value-of select="count(node()/parent::*/preceding-sibling::*[name()=$name])"/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="position()=last()">
						<xsl:value-of select="concat($name,'[',$pos,']')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat($name,'[',$pos,']','/')"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:variable>
		<xsl:value-of select="$xpath"/>
	</xsl:template>
	<xsl:template match="*" mode="date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="translate_number">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="translate(.,'.', ',')"/>
		</element>
	</xsl:template>
</xsl:stylesheet>
