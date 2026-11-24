<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:arcso="urn:customs.ru:Information:ExchangeDocuments:AircraftRegCertSubmitOblig:5.28.0">
	<!-- Шаблон для типа AircraftRegCertSubmitObligType -->
	<xsl:template match="arcso:AircraftRegCertSubmitOblig">
		<xsl:param name="w" select="190"/>
		<html>
			<head>
				<style>
                  body {
                  background: #cccccc;
                  font-family: Arial;
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
                  
                  .inlinetable
					{
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;
					display:-moz-inline-stack;/*Firefox 2*/
					display:inline-table; /*Хорошие браузеры*/
					_overflow:hidden;/*IE6, IE7*/
					*zoom:1;/*включаем hasLayout для IE6, IE7*/
					*display:inline;/*при hasLayout true display:inline в IE6, IE7 ведёт себя как display:inline-block*/	
					text-indent: 0;
					vertical-align: top;
					align: center;
					text-align: center;
					}
					.descr{
						font-size: 8pt;
						text-align: center;
					}
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="3">
										<b>Обязательство налогоплательщика налога на добавленную стоимость<br/>о представлении копии свидетельства о государственной регистрации<br/>гражданского воздушного судна в Государственном реестре<br/>гражданских воздушных судов Российской Федерации</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<xsl:text>Настоящим</xsl:text>
					<br/>
					<br/>
					<table class="inlinetable" style="width:100%">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="arcso:Taxpayer"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(идентификационный номер налогоплательщика, код причины постановки на учет (для юридических лиц), наименование и организационно-правовая форма юридического лица/фамилия, имя, отчество(при наличии) индивидуального предпринимателя или физического лица)
								</td>
							</tr>
						</tbody>
					</table>
					<br/><br/>
					<div style="text-align: justify;">
						<xsl:text>обязуется представить в таможенный орган в течение 90 календарных дней с даты регистрации таможенной декларации копию свидетельства о государственной регистрации гражданского воздушного судна в Государственном реестре гражданских воздушных судов Российской Федерации в отношении следующего гражданского воздушного судна:</xsl:text>
					</div>
					<br/>
					<table width="100%" style="font-size: 10pt;">
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered">№п/п</td>
								<td class="bordered">Тип (наименование, присвоенное изготовителем)</td>
								<td class="bordered">Серийный (идентификационный) номер</td>
								<td class="bordered">Наименование и страна изготовителя (для изготовителя воздушного судна самостоятельной постройки - фамилия, имя, отчество (при наличии)</td>
								<td class="bordered">Собственник (полное наименование организации (для физических лиц - фамилия, имя, отчество (при наличии)</td>
								<td class="bordered">Адрес местонахождения (места жительства) собственника</td>
							</tr>
							<xsl:for-each select="arcso:AircraftInfo">
								<tr>
									<td class="bordered">
										<xsl:apply-templates select="arcso:OrderNamber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="arcso:AircraftKind"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="arcso:SerialNamber"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="arcso:ManufacturerName"/>
										<xsl:text>, </xsl:text>
										<xsl:for-each select="arcso:ManufacturerCountry/*">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="arcso:Owner"/>
									</td>
									<td class="bordered">
										<xsl:apply-templates select="arcso:Address"/>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<table>
						<tbody>
							<tr>
								<td width="45%" style="border-bottom: 1px solid black;"></td>
								<td width="10%"></td>
								<td width="45%" style="border-bottom: 1px solid black;" align="center">
									<xsl:for-each select="arcso:AuthorizedPerson/*[contains(local-name(), 'ame')]">
										<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
										<xsl:apply-templates select="."/>
									</xsl:for-each>
								</td>
							</tr>
							<tr>
								<td class="descr">
									(подпись руководителя юридического лица либо уполномоченного им лица, индивидуального предпринимателя или физического лица)
								</td>
								<td/>
								<td class="descr">
									(фамилия, имя, отчество (при наличии) руководителя юридического лица либо уполномоченного им лица, индивидуального предпринимателя или физического лица)
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<br/>
					<br/>
					М.П.<sup>*</sup>
					<br/>
					<br/>
					<br/>
					<br/>
					<div class="descr">
						<sup>*</sup> Если в соответствии с законодательством Российской Федерации лицо, представившее обязательство, имеет печать
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UnifiedCode20Type -->
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код объекта в соответсвии со справочником (классификатором) </td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UnifiedCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CodeListId">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Обозначение справочника (классификатора), в соответствии с которым указан код</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CodeListId"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:UITN40Type -->
	<xsl:template match="RUScat_ru:UITN">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код. Универсальный идентификационный таможенный номер. Строка не более 40 символов</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="RUScat_ru:UITNCode"/>
					</td>
				</tr>
			</table>
			<xsl:if test="RUScat_ru:CountryCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Кодовое обозначение страны, по правилам которой сформирован указанный идентификатор</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="RUScat_ru:CountryCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="arcso:Address">
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- Шаблон для типа RUScat_ru:SubjectBaseDetailsType -->
	<xsl:template match="arcso:Taxpayer">
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:text> </xsl:text>
		<xsl:choose>
			<xsl:when test="cat_ru:OrganizationName">
				<xsl:apply-templates select="cat_ru:OrganizationName"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="cat_ru:ShortName"/>
			</xsl:otherwise>
		</xsl:choose>	
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
	</xsl:template>

	<!-- Шаблон для типа cat_ru:RFOrganizationFeaturesType -->
	<xsl:template match="cat_ru:RFOrganizationFeatures">
			<xsl:for-each select="*[contains('INN$KPP', local-name())]">
				<xsl:if test="position() != 1">, </xsl:if>
				<xsl:choose>
					<xsl:when test="local-name() = 'INN'">ИНН</xsl:when>
					<xsl:when test="local-name() = 'KPP'">КПП</xsl:when>
				</xsl:choose>
				<xsl:text> </xsl:text>
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
	<xsl:template match="//*[local-name()='AircraftRegCertSubmitOblig']//*" priority="-1">
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
