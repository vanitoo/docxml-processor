<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:stzm_dg="urn:customs.ru:Information:ExchangeDocuments:STZ_Migrant_DecisionGoods:5.24.0">
	<!-- Шаблон для типа STZ_Migrant_DecisionGoodsType -->
	<xsl:template match="stzm_dg:STZ_Migrant_DecisionGoods">
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
                </style>
			</head>
			<body>
				<div class="page" style="width: {$w}mm;">
				<xsl:variable name="regionKind" select="*[local-name() = 'RegionKind']"/>
					<table>
						<tbody>
							<tr>
								<td align="center" class="title">
									<font size="4">
										<b>
											<xsl:text>Решение</xsl:text>
											<br/>
											<xsl:choose>
												<xsl:when test="$regionKind = 1">
													<xsl:text>таможенного органа о приобретении товарами, указанными в части 1 статьи 16.4 Федерального закона от 10 января 2006 г. № 16-ФЗ "Об Особой экономической зоне в Калининградской области и о внесении изменений в некоторые законодательные акты Российской Федерации", статуса товаров Евразийского экономического союза</xsl:text>
												</xsl:when>
												<xsl:when test="$regionKind = 2">
													<xsl:text>таможенного органа о приобретении товарами, указанными в пункте 1 статьи 65.1 Федерального закона от 31 мая 1999 г. № 104-ФЗ «Об Особой экономической зоне в Магаданской области и на территориях Южно-Курильского, Курильского и Северо-Курильского городских округов Сахалинской области», статуса товаров Евразийского экономического союза</xsl:text>
												</xsl:when>
											</xsl:choose>
										</b>
									</font>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table>
						<tbody>
							<tr valign="top">
								<td width="50%">
									<b>
										<xsl:text>Регистрационный № </xsl:text>
									</b>
									<xsl:apply-templates select="stzm_dg:DecisionRegNumber" mode="reg_num"/>
								</td>
								<td width="50%">
									<b>
										<xsl:text>Кому</xsl:text>
									</b>
									<br/>
									<xsl:apply-templates select="stzm_dg:Applicant"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td align="center" style="border-top: 1px solid black; font-size:8pt;">
									<xsl:text>(лицо, переселяющееся с территории </xsl:text>
									<xsl:choose>
										<xsl:when test="$regionKind = 1">
											<xsl:text>Калининградской области</xsl:text>
										</xsl:when>
										<xsl:when test="$regionKind = 2">
											<xsl:text>Магаданской области или территорий Южно-Курильского, Курильского и Северо- Курильского городских округов Сахалинской области</xsl:text>
										</xsl:when>
									</xsl:choose>
									<xsl:text>, или лицо, им уполномоченное (фамилия, имя, отчество (при наличии), адрес фактического проживания и регистрации физического лица по месту жительства либо по месту пребывания, идентификационный номер налогоплательщика, сведения о документе, удостоверяющем личность физического лица, - для физического лица; полное наименование организации, основной государственный регистрационный номер, идентификационный номер налогоплательщика и код причины постановки на учет в налоговом органе, адрес юридического лица в пределах места нахождения юридического лица - для юридического лица - представителя)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<p style="text-indent: 5mm; text-align: justify;">
						<xsl:text>Настоящее решение свидетельствует о приобретении товарами, сведения о которых представлены в заявлении о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, указанных </xsl:text>
							<xsl:choose>
								<xsl:when test="$regionKind = 1">в части 1 статьи 16.4 Федерального закона от 10 января 2006 г. № 16-ФЗ "Об Особой экономической зоне в Калининградской области и о внесении изменений в некоторые законодательные акты Российской Федерации"</xsl:when>
								<xsl:when test="$regionKind = 2">в пункте 1 статьи 65'1 Федерального закона от 31 мая 1999 г. № 104-ФЗ "Об Особой экономической зоне в Магаданской области и на территориях Южно- Курильского, Курильского и Северо-Курильского городских округов Сахалинской области"</xsl:when>
							</xsl:choose>
						<xsl:text>, № </xsl:text>
						<xsl:apply-templates select="stzm_dg:AppRegNumber" mode="reg_num"/>
						<xsl:text>, статуса товаров Евразийского экономического союза в соответствии с пунктом 23 статьи 455 Таможенного кодекса Евразийского экономического союза* (далее - ТК ЕАЭС)</xsl:text>
					</p>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered">Наименование товара (торговое, коммерческое или иное традиционное наименование), в том числе автомобилей легковых и прицепов, указанных в абзаце первом пункта 23 статьи 455 ТК ЕАЭС (далее - Товары)</td>
								<td class="bordered">Количество Товара/единица измерения в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности</td>
								<td class="bordered">Идентификационные (отличительные) признаки Товара: серийный номер или другая маркировка производителя Товара, цвет, марка, форма, год выпуска, иные признаки Товара</td>
								<td class="bordered">Отметка таможенного органа о фактическом вывозе товаров</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
								<td class="bordered">5</td>
							</tr>
							<xsl:apply-templates select="stzm_dg:GoodsInfo"/>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="stzm_dg:CustomsSignature"/>
					<br/>
					<p style="font-size: 8pt;">* Является обязательным для Российской Федерации в соответствии с Федеральным законом от 14 ноября 2017 г. № 317-ФЗ "О ратификации Договора о Таможенном кодексе Евразийского экономического союза", вступил в силу для Российской Федерации 1 января 2018 г.</p>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="stzm_dg:Address">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressKindCode = 1">адрес регистрации: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode = 2">адрес фактического проживания: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode = 3">почтовый адрес: </xsl:when>
			<xsl:otherwise>адрес: </xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressText">
				<xsl:apply-templates select="RUScat_ru:AddressText"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressKindCode' and local-name() != 'AddressText']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа stzm_dg:ApplicantType -->
	<xsl:template match="stzm_dg:Applicant">
		<xsl:choose>
			<xsl:when test="stzm_dg:PersonName">
				<xsl:for-each select="stzm_dg:PersonName/*">
					<xsl:if test="position() != 1">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="stzm_dg:Address"/>
				<xsl:text>, </xsl:text>
				<xsl:text>ИНН </xsl:text>
				<xsl:apply-templates select="stzm_dg:INN"/>
				<xsl:if test="stzm_dg:IdentityCard">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="stzm_dg:IdentityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="stzm_dg:OrganizationName">
				<xsl:apply-templates select="stzm_dg:OrganizationName"/>
				<xsl:if test="stzm_dg:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="stzm_dg:OGRN"/>
				</xsl:if>
				<xsl:text>, ИНН </xsl:text>
				<xsl:apply-templates select="stzm_dg:INN"/>
				<xsl:if test="stzm_dg:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="stzm_dg:KPP"/>
				</xsl:if>
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="stzm_dg:Address"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<!-- Шаблон для типа stzm_dg:AutomobileInfoType -->
	<xsl:template match="stzm_dg:AutomobileInfo">

			<xsl:if test="stzm_dg:Model">
				<xsl:text>, модель: </xsl:text><xsl:apply-templates select="stzm_dg:Model"/>
			</xsl:if>
			<xsl:if test="stzm_dg:Mark">
				<xsl:text>, марка: </xsl:text><xsl:apply-templates select="stzm_dg:Mark"/>
			</xsl:if>
			<xsl:if test="stzm_dg:MarkCode">
				<xsl:text>, код марки: </xsl:text><xsl:apply-templates select="stzm_dg:MarkCode"/>
			</xsl:if>
			<xsl:if test="stzm_dg:ManufactureDate">
				<xsl:text>, дата производства: </xsl:text><xsl:apply-templates select="stzm_dg:ManufactureDate" mode="russian_date"/>
			</xsl:if>
			<xsl:if test="stzm_dg:ManufactureYear">
				<xsl:text>, год выпуска: </xsl:text><xsl:apply-templates select="stzm_dg:ManufactureYear"/>
			</xsl:if>
			<xsl:if test="stzm_dg:ManufactureMonth">
				<xsl:text>, месяц выпуска: </xsl:text><xsl:apply-templates select="stzm_dg:ManufactureMonth"/>
			</xsl:if>
			<xsl:if test="stzm_dg:EngineVolumeQuanity">
				<xsl:text>, объем двигателя (куб.см): </xsl:text><xsl:apply-templates select="stzm_dg:EngineVolumeQuanity" mode="translate_number"/>
			</xsl:if>
			<xsl:if test="stzm_dg:VINID">
				<xsl:text>, VIN: </xsl:text><xsl:apply-templates select="stzm_dg:VINID"/>
			</xsl:if>
			<xsl:if test="stzm_dg:VINChassisID">
				<xsl:text>, ID рамы (шасси): </xsl:text><xsl:apply-templates select="stzm_dg:VINChassisID"/>
			</xsl:if>
			<xsl:if test="stzm_dg:VINBodyID">
				<xsl:text>, ID кузова (кабины): </xsl:text><xsl:apply-templates select="stzm_dg:VINBodyID"/>
			</xsl:if>
			<xsl:if test="stzm_dg:TransportCategoryCode">
				<xsl:text>, код категории: </xsl:text><xsl:apply-templates select="stzm_dg:TransportCategoryCode"/>
			</xsl:if>
			<xsl:if test="stzm_dg:TransportTypeName">
				<xsl:text>, наименование: </xsl:text><xsl:apply-templates select="stzm_dg:TransportTypeName"/>
			</xsl:if>
			<xsl:if test="stzm_dg:TransportColorCode">
				<xsl:text>, код цвета: </xsl:text><xsl:apply-templates select="stzm_dg:TransportColorCode"/>
			</xsl:if>
			<xsl:if test="stzm_dg:ColorListElement">
				<xsl:text>, код цвета элементов: </xsl:text>
				<xsl:for-each select="stzm_dg:ColorListElement">
					<xsl:if test="position()!=1">, </xsl:if>
					<xsl:value-of select="."/>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="stzm_dg:ECOClassCode">
				<xsl:text>, эко: </xsl:text><xsl:apply-templates select="stzm_dg:ECOClassCode"/>
			</xsl:if>
			<xsl:if test="stzm_dg:EngineId">
				<xsl:text>, ID двигателя: </xsl:text><xsl:apply-templates select="stzm_dg:EngineId"/>
			</xsl:if>
			<xsl:if test="stzm_dg:CapacityQuantity">
				<xsl:text>, вместимость: </xsl:text><xsl:apply-templates select="stzm_dg:CapacityQuantity"/>
			</xsl:if>
			<xsl:if test="stzm_dg:OrganizationName">
				<xsl:text>, организация-изготовитель: </xsl:text><xsl:apply-templates select="stzm_dg:OrganizationName"/>
			</xsl:if>
			<xsl:if test="stzm_dg:UnifiedCountryCode">
				<xsl:text>, страна-изготовитель: </xsl:text><xsl:apply-templates select="stzm_dg:UnifiedCountryCode"/>
			</xsl:if>
			<xsl:if test="stzm_dg:TransportMeansRegId">
				<xsl:text>, рег.номер: </xsl:text><xsl:apply-templates select="stzm_dg:TransportMeansRegId"/>
			</xsl:if>

	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="stzm_dg:Customs">
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
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="stzm_dg:CustomsSignature">
		<table>
			<tbody>
				<tr valign="bottom">
					<td width="30%">
						<xsl:apply-templates select="cat_ru:PersonPost"/>
					</td>
					<td width="5%"></td>
					<td width="20%"></td>
					<td width="5%"></td>
					<td width="40%">
						<xsl:apply-templates select="cat_ru:PersonSurname"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonName"/>
						<xsl:text> </xsl:text>
						<xsl:apply-templates select="cat_ru:PersonMiddleName"/>
					</td>
				</tr>
				<tr align="center" valign="top">
					<td style="border-top:1px solid black; font-size: 8pt;">(начальник таможенного органа, или лицо, его заменяющее)</td>
					<td></td>
					<td style="border-top:1px solid black; font-size: 8pt;">(подпись)</td>
					<td></td>
					<td style="border-top:1px solid black; font-size: 8pt;">(фамилия, имя, отчество (при наличии)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа stzm_dg:RegistrationNumberType -->
	<xsl:template match="*" mode="reg_num">
		<xsl:apply-templates select="*[local-name() = 'CustomsCode']"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'RegistrationDate']" mode="num_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="*[local-name() = 'Number']"/>
		<xsl:if test="*[local-name() = 'DocKind']">
			<xsl:text>/</xsl:text>
			<xsl:apply-templates select="*[local-name() = 'DocKind']"/>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа stzm_dg:EngineType -->
	<xsl:template match="stzm_dg:Engine">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="stzm_dg:EngineModeCode='1'">
							<xsl:text>бензиновый</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='2'">
							<xsl:text>дизельный</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='3'">
							<xsl:text>электрический</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='4'">
							<xsl:text>гибридный на основе бензинового</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='5'">
							<xsl:text>гибридный на основе дизельного</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='6'">
							<xsl:text>конв</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_dg:EngineModeCode='7'">
							<xsl:text>иной</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="stzm_dg:EngineModeCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_dg:EngineModeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_dg:EngineModel"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_dg:FuelName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_dg:EnginePowerHpQuanity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_dg:EnginePowerKvtQuanity" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stzm_dg:GoodsInfoType -->
	<xsl:template match="stzm_dg:GoodsInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_dg:NumPP"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_dg:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_dg:SupplementaryQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_dg:Manufacturer"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:TradeMark"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:GoodsMark"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:GoodsMarking"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:GoodsStandard"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:OriginCountryCode"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_dg:AutomobileInfo"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="stzm_dg:CustomsMark">
					<xsl:apply-templates select="stzm_dg:CustomsMark"/>
					<br/>
					<br/>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="stzm_dg:Resolution='1'">
						<xsl:text>решение таможенного органа о приобретении товарами статуса товаров ЕАЭС</xsl:text>
					</xsl:when>
					<xsl:when test="stzm_dg:Resolution='2'">
						<xsl:text>отказ в выдаче Решения таможенного органа о приобретении товарами статуса товаров ЕАЭС</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="stzm_dg:Resolution"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:if test="stzm_dg:RejectionReason"><br/></xsl:if>
				<xsl:apply-templates select="stzm_dg:RejectionReason"/>				
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:RUIdentityCardType -->
	<xsl:template match="stzm_dg:IdentityCard">

		<xsl:if test="RUScat_ru:IdentityCardName">
			<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		</xsl:if>
		<xsl:if test="not(RUScat_ru:IdentityCardName) and RUScat_ru:FullIdentityCardName">
			<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardSeries">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCardNumber">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:text> выдан </xsl:text>
		<xsl:if test="RUScat_ru:IdentityCardDate">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IdentityCardDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:OrganizationName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="RUScat_ru:IssuerCode"/>
		</xsl:if>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="stzm_dg:SupplementaryQuantity">
		<xsl:apply-templates select="cat_ru:GoodsQuantity" mode="translate_number"/>
		<xsl:if test="cat_ru:MeasureUnitQualifierName">
			<xsl:text> </xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierName"/>
		</xsl:if>
		<xsl:if test="cat_ru:MeasureUnitQualifierCode">
			<xsl:text> (</xsl:text>
			<xsl:apply-templates select="cat_ru:MeasureUnitQualifierCode"/>
			<xsl:text>)</xsl:text>
		</xsl:if>	
	</xsl:template>
	<!-- Шаблон для типа RUScat_ru:TransportMeansRegIdType -->
	<xsl:template match="stzm_dg:TransportMeansRegId">

		<xsl:apply-templates select="RUScat_ru:TransportMeansRegIdNumber"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="RUScat_ru:CountryCode"/>
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
	<xsl:template name="num_date">
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
	<xsl:template match="//*[local-name()='STZ_Migrant_DecisionGoods']//*" priority="-1">
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
	<xsl:template match="*" mode="num_date">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="num_date">
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
