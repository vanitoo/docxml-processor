<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdm="urn:customs.ru:Information:CustomsDocuments:RecyclingDetailsMark:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа RecyclingDetailsMarkType -->
	<xsl:template match="rdm:RecyclingDetailsMark">
		<xsl:param name="w" select="320"/>
		<html>
			<head>
				<style>
                  body {
                  font-family: Arial;
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
                  padding: 10mm 20mm 10mm 20mm;
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
										<b>Служебные отметки к расчету утилизационного сбора</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<!--table>
						<tr>
							<td class="annot graphMain" style="width:50%">Уникальный идентификатор документа</td>
							<td class="value graphMain" style="width:50%">
								<xsl:apply-templates select="cat_ru:DocumentID"/>
							</td>
						</tr>
					</table>
					<xsl:if test="cat_ru:RefDocumentID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Уникальный идентификатор исходного документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:RefDocumentID"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:INNSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">ИНН владельца МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:INNSign"/>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="cat_ru:MCD_ID">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Единый регистрационный номер доверенности в формате МЧД</td>
								<td class="value graphMain" style="width:50%">
									<xsl:apply-templates select="cat_ru:MCD_ID"/>
								</td>
							</tr>
						</table>
					</xsl:if-->
					<xsl:if test="rdm:DocSign">
						<table>
							<tr>
								<td class="annot graphMain" style="width:50%">Признак документа</td>
								<td class="value graphMain" style="width:50%">
									<xsl:choose>
										<xsl:when test="rdm:DocSign='0'">
											<xsl:text>действует</xsl:text>
										</xsl:when>
										<xsl:when test="rdm:DocSign='1'">
											<xsl:text>аннулирован</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="rdm:DocSign"/>
										</xsl:otherwise>
									</xsl:choose>
								</td>
							</tr>
						</table>
					</xsl:if>
					<xsl:if test="rdm:RegNum">
						<div class="title marg-top">Регистрационный номер РУС</div>
						<div>
							<xsl:apply-templates select="rdm:RegNum">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="rdm:DTNum">
						<div class="title marg-top">Регистрационный номер таможенной декларации</div>
						<div>
							<xsl:apply-templates select="rdm:DTNum">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<div class="title marg-top">Сведения о ТС</div>
					<table class="bordered">
						<tbody>
							<tr class="title">
								<td class="graphMain bordered">Номер товара в Расчете </td>
								<td class="graphMain bordered">Номер товара в декларации</td>
								<td class="graphMain bordered">Номер ТС в гр 31 товара ДТ</td>
								<td class="graphMain bordered">Признак освобождения от уплаты</td>
								<td class="graphMain bordered">Код освобождения от уплаты от утилизационных сборов</td>
								<td class="graphMain bordered">Основание для освобождения от уплаты</td>
								<td class="graphMain bordered">Номер ТПО / Документа расчета</td>
								<td class="graphMain bordered">Результат оформления ТПО</td>
								<td class="graphMain bordered">Дата пересечения границы</td>
								<td class="graphMain bordered">Признак ввоза ТС из Республики Беларусь</td>
								<td class="graphMain bordered">Признак седельного тягача класса Евро-6</td>
								<td class="graphMain bordered">Признак приобретения ТС у лица, использовавшего его не для личного пользования</td>
								<td class="graphMain bordered">Признак второго или каждого последующего транспортного средства, ввезенного лицом на территорию РФ</td>
								<td class="graphMain bordered">Служебные отметки</td>
							</tr>
							<xsl:for-each select="rdm:UtilCollDetails">
								<xsl:apply-templates select=".">
									<xsl:with-param name="wdth" select="$w"/>
								</xsl:apply-templates>
							</xsl:for-each>
						</tbody>
					</table>
					<xsl:if test="rdm:Customs">
						<div class="title marg-top">Таможенный орган</div>
						<div>
							<xsl:apply-templates select="rdm:Customs">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
					<xsl:if test="rdm:CustomsPerson">
						<div class="title marg-top">Должностное лицо таможенного органа</div>
						<div>
							<xsl:apply-templates select="rdm:CustomsPerson">
								<xsl:with-param name="wdth" select="$w"/>
							</xsl:apply-templates>
						</div>
					</xsl:if>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="rdm:Customs">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Код таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:Code"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:OfficeName">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Наименование таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:OfficeName"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsPersonType -->
	<xsl:template match="rdm:CustomsPerson">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">ФИО должностного лица таможенного органа</td>
					<td class="value graphMain" style="width:50%">
						<xsl:apply-templates select="cat_ru:PersonName"/>
					</td>
				</tr>
			</table>
			<xsl:if test="cat_ru:LNP">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">ЛНП должностного лица таможенного органа</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:LNP"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="cat_ru:CustomsCode">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код таможенного органа, указанный на оттиске ЛНП</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="cat_ru:CustomsCode"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="rdm:DTNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
			<xsl:apply-templates select="cat_ru:CustomsCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_num"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:DocNumberType -->
	<xsl:template match="rdm:RegNum">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
			<xsl:apply-templates select="cat_ru:CustomsCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:RegistrationDate" mode="russian_date_num"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="cat_ru:GTDNumber"/>
			<xsl:if test="RUScat_ru:AddNumber">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="RUScat_ru:AddNumber"/>
			</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rdm:TPORegNumberType -->
	<xsl:template match="rdm:TPORegNumber">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>

			<xsl:apply-templates select="rdm:CustomsCode"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="rdm:RegistrationDate" mode="russian_date_num"/>
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="rdm:DocNumber"/>
			<xsl:if test="rdm:NumPP">
				<xsl:text>/</xsl:text>
				<xsl:apply-templates select="rdm:NumPP"/>
			</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа rdm:UtilCollDetailsType -->
	<xsl:template match="rdm:UtilCollDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:GoodsRecNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:GoodsDTNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:RecNumber"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="rdm:NoPayIndicator='1'">
							<xsl:text>освобождается от уплаты</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:NoPayIndicator='0'">
							<xsl:text>нет оснований для освобождения от уплаты</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:NoPayIndicator='2'">
							<xsl:text>не уплачивается по характеристикам ТС</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rdm:NoPayIndicator"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:CodeReasonFreePayment"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:NoPayReasons"/>
				</td>
				<td class="graphMain bordered">
					<xsl:if test="rdm:TPORegNumber">
						<xsl:apply-templates select="rdm:TPORegNumber">
							<xsl:with-param name="wdth" select="$w"/>
						</xsl:apply-templates>
					</xsl:if>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:PayResult"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:BorderCrossingDate" mode="russian_date"/>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="rdm:ImportRBSign='true' or rdm:ImportRBSign='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:ImportRBSign='false' or rdm:ImportRBSign='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rdm:ImportRBSign"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="rdm:TruckEuro6Sign='true' or rdm:TruckEuro6Sign='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:TruckEuro6Sign='false' or rdm:TruckEuro6Sign='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rdm:TruckEuro6Sign"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="rdm:VehicleWasNotPersonalSign='true' or rdm:VehicleWasNotPersonalSign='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:VehicleWasNotPersonalSign='false' or rdm:VehicleWasNotPersonalSign='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rdm:VehicleWasNotPersonalSign"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="rdm:SecondOrMoreVehicleSign='true' or rdm:SecondOrMoreVehicleSign='1'">
							<xsl:text>ДА</xsl:text>
						</xsl:when>
						<xsl:when test="rdm:SecondOrMoreVehicleSign='false' or rdm:SecondOrMoreVehicleSign='0'">
							<xsl:text>НЕТ</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="rdm:SecondOrMoreVehicleSign"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="rdm:Comment"/>
				</td>
			</tr>
		</div>
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
	<xsl:template name="russian_date_num">
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
	<xsl:template match="//*[local-name()='RecyclingDetailsMark']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_num">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_num">
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
