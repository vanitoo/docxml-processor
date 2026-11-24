<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="whgou cat_ru catWH_ru" version="1.0" xmlns:catWH_ru="urn:customs.ru:Information:WarehouseDocuments:WarehouseCommonAggregateTypesCust:5.24.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:whgou="urn:customs.ru:Information:WarehouseDocuments:WHGoodOut:5.27.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0">
	<xsl:output encoding="UTF-8" indent="yes" method="html" version="1.0"/>
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template name="say_document_kind">
		<xsl:param name="kind"/>
		<xsl:choose>
			<xsl:when test="$kind='DtRegistration'">
            Сведения о товарах из зарегистрированной ДТ
         </xsl:when>
			<xsl:when test="$kind='DtCancelation'">
            Сведения об отзыве ДТ
         </xsl:when>
			<xsl:when test="$kind='DtIssueProhibited'">
            Сведения об отказе в выпуске товаров по ДТ
         </xsl:when>
			<xsl:when test="$kind='DtIssueSuspended'">
            Сведения о продлении сроков выпуска по ДТ
         </xsl:when>
			<xsl:when test="$kind='DtGoodsChanged'">
            Сведения о товарах из изменнной ДТ
         </xsl:when>
			<xsl:when test="$kind='GoodOutDecision'">
            Уведомление о выпуске товаров по ДТ
         </xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$kind"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="whgou:WHGoodOut">
		<html>
			<head>
				<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
				<title>Информация по товарам для владельца склада</title>
				<style type="text/css">
                    body {background: #CCCCCC; font-size: 9pt;}
                    div.page {
                        width: 210mm;
                        margin: 10px auto;
                        padding: 5mm 10mm;
                        background: white;
                        border: solid 1px black;
                        page-break-after: always;
                    }
                    /*Стиль для удаления чёрной границы вокруг нарисованной "страницы" при печати*/
                    @media print {div.page {border: none; margin: 0; padding: 0;}}
                    div.goods {background: white;}
                    .bordered {
                        border: solid 1px black;
                        padding-top: 4pt;
                        padding-bottom: 4pt;
                        font-family: Arial;
                        font-size: 9pt;
                        font-weight: bold;
                    }
                    .underlined {border-bottom: solid 0.8pt black;}
                    p.NumberDate {font-weight: bold;}
                    .graph {font-family: Arial; font-size: 7pt;}
                    .graphColumn {font-family: Arial; font-size: 6.5pt;}
                    .graphTitleIt {font-family: Arial; font-size: 7pt; font-style: italic;}
                    .graphMain {font-family: Arial; font-size: 9pt; font-weight: bold; }
                    .graphNum {font-family: Arial; font-size: 7pt; font-weight: bold;}
                    .graphNo {font-size: 7pt; font-weight: bold;}
                    h1{font-size: 12pt;}
                    table.addInfo {border-collapse: collapse; vertical-align: top;}
                    table.addInfo th {border: 1px solid black; background-color: LightGrey;}
                    table.addInfo td {border: 1px solid black; vertical-align: top;}
                    hr {border: 0; border-bottom: 1px solid black; margin: 0;}
                    .tr {border-right: 1px solid black;}
                    .tl {border-left: 1px solid black;}
                    .tb {border-bottom: 1px solid black;}
                    .tt {border-top: 1px solid black;}
                    .br {border-right: 2px solid black;}
                    .bl {border-left: 2px solid black;}
                    .bb {border-bottom: 2px solid black;}
                    .bt {border-top: 2px solid black;}
                    .db {border-bottom: 1px dashed black;}
                    .dl {border-left: 1px dashed black;}
                    .number {
                        text-align: center;
                        color: black;
                        font-size: 11pt;
                        font-weight: bold;
                        vertical-align: middle;
                    }
                </style>
			</head>
			<body>
				<div class="page">
					<table cellpadding="0" cellspacing="0" style="width:100%;border:solid 0pt #000000;">
						<tbody>
							<tr>
								<td align="center" class="graphMain" style="width:180mm;">
									<xsl:call-template name="say_document_kind">
										<xsl:with-param name="kind" select="whgou:DocumentKind"/>
									</xsl:call-template>
									<br/>
								</td>
							</tr>
							<xsl:if test="whgou:RegisterNumber">
								<tr>
									<td align="center" class="graphMain" style="width:180mm;">
										<br/>
										Номер по журналу регистрации ТО 
										<u>
											<xsl:apply-templates select="whgou:RegisterNumber"/>
										</u>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td align="center" class="graphMain" style="width:180mm;">
									<br/>
									Дата и время направления
									<u>
										<xsl:apply-templates mode="russian_date" select="whgou:SendDate"/>
										<xsl:text> </xsl:text>
										<xsl:apply-templates mode="russian_time" select="whgou:SendTime"/>
									</u>
								</td>
							</tr>
							<tr>
								<td class="graph" style="width:180mm;">
									<br/>
									<xsl:text>Сведения о документе: </xsl:text>
									<xsl:apply-templates select="whgou:ProduceDocuments/cat_ru:PrDocumentName"/>
									<xsl:if test="whgou:ProduceDocuments/cat_ru:PrDocumentNumber">
										<xsl:text> № </xsl:text>
										<xsl:choose>
											<xsl:when test="whgou:ProduceDocuments[catWH_ru:PresentedDocumentModeCode != '02024']">
												<xsl:apply-templates select="whgou:ProduceDocuments/whgou:CustomsCode"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="whgou:ProduceDocuments/cat_ru:PrDocumentDate" mode="russian_date_gtd"/>
												<xsl:text>/</xsl:text>
												<xsl:apply-templates select="whgou:ProduceDocuments/cat_ru:PrDocumentNumber"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="whgou:ProduceDocuments/cat_ru:PrDocumentNumber"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
									<xsl:if test="whgou:ProduceDocuments/cat_ru:PrDocumentDate">
										<xsl:text> от </xsl:text>
										<xsl:apply-templates mode="russian_date" select="whgou:ProduceDocuments/cat_ru:PrDocumentDate"/>
									</xsl:if>
									<!--xsl:if test="whgou:ProduceDocuments/whgou:CustomsCode">
										<xsl:text> код ТО </xsl:text>
										<xsl:apply-templates select="whgou:ProduceDocuments/whgou:CustomsCode"/>
									</xsl:if-->
									<xsl:if test="whgou:ReleaseDate">
										<br/>
										<xsl:text> Дата выпуска: </xsl:text>
										<xsl:apply-templates mode="russian_date" select="whgou:ReleaseDate"/>
									</xsl:if>
								</td>
							</tr>
							<xsl:if test="whgou:CustomsProcedure">
								<tr>
									<td class="graph" style="width:180mm;">
										Направление перемещения и сведения о таможенной процедуре: 
										<xsl:text> </xsl:text>
										<xsl:if test="whgou:CustomsProcedure">
											<xsl:variable name="proc" select="whgou:CustomsProcedure/whgou:CustomsProcedure"/>
											<xsl:variable name="code" select="whgou:CustomsProcedure/whgou:MainCustomsModeCode"/>
											<xsl:choose>
												<xsl:when test="$proc = '__' and $code='_1'">В свободное обращение</xsl:when>
												<xsl:when test="$proc = '__' and $code='_2'">Временный ввоз</xsl:when>
												<xsl:when test="$proc = '__' and $code='_3'">Для вывоза</xsl:when>
												<xsl:when test="$proc = '__' and $code='_4'">Для временного нахождения вне таможенной территории Союза</xsl:when>
												<xsl:when test="$proc = '__' and $code='_5'">Транзит</xsl:when>
												<xsl:otherwise>
													<xsl:for-each select="whgou:CustomsProcedure/*">
														<xsl:if test="position()!=1"><xsl:text> </xsl:text></xsl:if>
														<xsl:apply-templates select="."/>
													</xsl:for-each>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:if>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" style="width:180mm;">
                           	Сведения о лицензии СВХ: 
									<xsl:choose>
										<xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='1'">Лицензия </xsl:when>
										<xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='2'">Свидетельство </xsl:when>
										<xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='3'">Разрешение </xsl:when>
										<xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='4'">Приказ о создании постоянной ЗТК </xsl:when>
										<xsl:when test="whgou:SVHLicenceNumber/whgou:DocumentModeCode='5'">Приказ о создании временной ЗТК </xsl:when>
									</xsl:choose>
									<xsl:apply-templates select="whgou:SVHLicenceNumber/cat_ru:PrDocumentName"/>
									<xsl:if test="whgou:SVHLicenceNumber/cat_ru:PrDocumentNumber">
											№ <xsl:apply-templates select="whgou:SVHLicenceNumber/cat_ru:PrDocumentNumber"/>
									</xsl:if>
									<xsl:if test="whgou:SVHLicenceNumber/cat_ru:PrDocumentDate">
											от 
											<xsl:apply-templates mode="russian_date" select="whgou:SVHLicenceNumber/cat_ru:PrDocumentDate"/>
									</xsl:if>
								</td>
							</tr>
							<xsl:if test="whgou:TotalPackageNumber">
								<tr>
									<td class="graph" style="width:180mm;">
										<xsl:text>Общее количество мест товара: </xsl:text>
										<xsl:apply-templates select="whgou:TotalPackageNumber"/>
									</td>
								</tr>
							</xsl:if>
							<xsl:for-each select="whgou:DeclarantPerson">
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Декларант: </u>
										<br/>
										<xsl:for-each select="*[contains(local-name(), 'ame')]">
											<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
											<xsl:apply-templates select="."/>
										</xsl:for-each>
										<xsl:if test="whgou:INN">
											<br/>
											ИНН <xsl:apply-templates select="whgou:INN"/>
										</xsl:if>
										<xsl:for-each select="whgou:Address">
											<br/>
											<xsl:apply-templates select="." mode="address"/>
										</xsl:for-each>
										<xsl:if test="whgou:PersonIdCard">
											<br/>
											Документ, удостоверяющий личность: 
											<xsl:apply-templates select="whgou:PersonIdCard"/>
										</xsl:if>
										<xsl:if test="whgou:BirthDate">
											<br/>
											Дата рождения: <xsl:apply-templates select="whgou:BirthDate" mode="russian_date"/>
										</xsl:if>
										<xsl:if test="whgou:RegDocumentReference">
											<br/>
											Виза: <xsl:for-each select="whgou:RegDocumentReference/*[contains(local-name(), 'PrDocument')]">
												<xsl:choose>
													<xsl:when test="contains(local-name(), 'Date')"> от </xsl:when>
													<xsl:when test="contains(local-name(), 'Number')"> № </xsl:when>
												</xsl:choose>
												<xsl:choose>
													<xsl:when test="contains(local-name(), 'Date')">
														<xsl:apply-templates select="." mode="russian_date"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:apply-templates select="."/>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
										</xsl:if>
										<xsl:if test="whgou:CountryDeparture">
											<br/>
											Страна отправления: <xsl:apply-templates select="whgou:CountryDeparture" mode="country"/>
										</xsl:if>
										<xsl:if test="whgou:CountryDestination">
											<br/>
											Страна назначения: <xsl:apply-templates select="whgou:CountryDestination" mode="country"/>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
							<xsl:for-each select="whgou:DeliveryGoods">
								<tr>
									<td align="center" class="graphMain" style="width:180mm;">
										<br/>
									Описание товаров <xsl:value-of select="position()"/>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Грузополучатель: </u>
										<br/>
										<xsl:for-each select="whgou:Consignee">
											<xsl:apply-templates select="cat_ru:OrganizationName"/>
											<xsl:if test="cat_ru:ShortName">
												<span class="graph">(</span>
												<xsl:apply-templates select="cat_ru:ShortName"/>
												<span class="graph">)</span>
											</xsl:if>
											<xsl:if test="(cat_ru:RFOrganizationFeatures) or (cat_ru:RBOrganizationFeatures) or (cat_ru:RKOrganizationFeatures)">
												<br/>
												<xsl:text>№ </xsl:text>
												<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:ITN">ИТН: 
												<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:CategoryCode"/>/
													<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:KATOCode"/>/
													<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:RNN"/>/
													<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:ITN/cat_ru:ITNReserv"/>
												</xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">ОГРН: 
												<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
												</xsl:if>
												<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												<xsl:if test="cat_ru:RBOrganizationFeatures/cat_ru:UNP">УНП:
													<xsl:apply-templates select="cat_ru:RBOrganizationFeatures/cat_ru:UNP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:BIN">БИН:
													<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:BIN"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:if test="cat_ru:RKOrganizationFeatures/cat_ru:IIN">ИИН:
													<xsl:apply-templates select="cat_ru:RKOrganizationFeatures/cat_ru:IIN"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">ИНН:
													<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
												<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:KPP">
													<xsl:text> / КПП: </xsl:text>
													<xsl:apply-templates select="cat_ru:RFOrganizationFeatures/cat_ru:KPP"/>
													<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
												</xsl:if>
											</xsl:if>
											<xsl:if test="catWH_ru:Address">
												<br/>
												<xsl:if test="catWH_ru:Address/cat_ru:PostalCode">
													<xsl:apply-templates select="catWH_ru:Address/cat_ru:PostalCode"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:Address/cat_ru:CountryCode">
													<xsl:apply-templates select="catWH_ru:Address/cat_ru:CountryCode"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:Address/cat_ru:Region">
													<xsl:apply-templates select="catWH_ru:Address/cat_ru:Region"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:Address/cat_ru:City">
													<xsl:apply-templates select="catWH_ru:Address/cat_ru:City"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:Address/cat_ru:StreetHouse">
													<xsl:apply-templates select="catWH_ru:Address/cat_ru:StreetHouse"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:Address/catWH_ru:AddressLine">
													<xsl:apply-templates select="catWH_ru:Address/catWH_ru:AddressLine"/>
												</xsl:if>
											</xsl:if>
											<xsl:if test="catWH_ru:IdentityCard">
												<br/>
											Документ, удостоверяющий личность получателя: 
											<xsl:apply-templates select="catWH_ru:IdentityCard"/>
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Описание транспортного средства: </u>
										<xsl:for-each select="whgou:Transport">
											<br/>
											<xsl:value-of select="position()"/>.
											Код вида транспорта: <xsl:value-of select="catWH_ru:TransportModeCode"/>,
											номер: <xsl:apply-templates select="catWH_ru:TransportIdentifier"/>,
											<xsl:choose>
												<xsl:when test="catWH_ru:Avia">
													<xsl:if test="catWH_ru:Avia/catWH_ru:FlightNumber">
														номер рейса: <xsl:apply-templates select="catWH_ru:Avia/catWH_ru:FlightNumber"/>,
													</xsl:if>
													<xsl:if test="catWH_ru:Avia/catWH_ru:FlightDate">
														дата рейса: 
														<xsl:apply-templates mode="russian_date" select="catWH_ru:Avia/catWH_ru:FlightDate"/>,
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:Avto">
													<xsl:if test="catWH_ru:Avto/catWH_ru:TrailerIdentifier">
														номер прицепного транспортного средства: <xsl:apply-templates select="catWH_ru:Avto/catWH_ru:TrailerIdentifier"/>,
													</xsl:if>
													<xsl:if test="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier">
														номер второго прицепного транспортного средства: <xsl:apply-templates select="catWH_ru:Avto/catWH_ru:SecondTrailerIdentifier"/>,
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:RailRoad">
													<xsl:if test="catWH_ru:RailRoad/catWH_ru:RailStation">
														код станции отправления/назначения: <xsl:apply-templates select="catWH_ru:RailRoad/catWH_ru:RailStation"/>,
													</xsl:if>
												</xsl:when>
												<xsl:when test="catWH_ru:Sea">
													<xsl:if test="catWH_ru:Sea/catWH_ru:EntryNumber">
														номер прихода/ухода: <xsl:apply-templates select="catWH_ru:Sea/catWH_ru:EntryNumber"/>,
													</xsl:if>
													<xsl:if test="catWH_ru:Sea/catWH_ru:CountryCode">
														страна принадлежности судна: <xsl:apply-templates select="catWH_ru:Sea/catWH_ru:CountryCode"/>,
													</xsl:if>
												</xsl:when>
											</xsl:choose>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Товар: </u>
										<xsl:for-each select="whgou:GoodInfo">
											<br/>
											<xsl:apply-templates select="catWH_ru:GoodsNumber"/>.
											<xsl:if test="catWH_ru:GoodsTNVEDCode">
												код товара: <xsl:apply-templates select="catWH_ru:GoodsTNVEDCode"/>,
											</xsl:if>
											<xsl:if test="catWH_ru:InvoiceCost">
												фактурная стоимость: <xsl:apply-templates select="catWH_ru:InvoiceCost"/>
											</xsl:if>
											<xsl:if test="catWH_ru:CurrencyCode">
												<xsl:apply-templates select="catWH_ru:CurrencyCode"/>,
											</xsl:if>
											<xsl:for-each select="catWH_ru:GoodsDescriptionFull/catWH_ru:GoodsDescription">
												<xsl:apply-templates select="."/>
												<xsl:text> </xsl:text>
											</xsl:for-each>
											<xsl:if test="catWH_ru:MPONumber">
												номер МПО: <xsl:apply-templates select="catWH_ru:MPONumber"/>,
											</xsl:if>
											<xsl:if test="catWH_ru:MPOCaseNum">
												номер емкости, в которой находится МПО: <xsl:apply-templates select="catWH_ru:MPOCaseNum"/>,
											</xsl:if>
											<xsl:if test="catWH_ru:CargoPlace">
												<br/>
												<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceNumber">
													Количество грузовых мест: <xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceNumber"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PackageCode">
													код вида упаковки: <xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PackageCode"/>,
												</xsl:if>
												<xsl:if test="catWH_ru:CargoPlace/catWH_ru:PlaceDescription">
													описание грузовых мест: <xsl:apply-templates select="catWH_ru:CargoPlace/catWH_ru:PlaceDescription"/>,
												</xsl:if>
											</xsl:if>
											<xsl:if test="catWH_ru:BruttoVolQuant">
												<br/>
												Вес брутто / объем: 
												<xsl:apply-templates select="catWH_ru:BruttoVolQuant"/>
											</xsl:if>
											<xsl:if test="catWH_ru:MeasureQuantity">
												<br/>
												Количество в дополнительных  единицах измерения: 
												<xsl:apply-templates select="catWH_ru:MeasureQuantity"/>
											</xsl:if>
											<xsl:if test="whgou:AdditionalPackageInformation">
												<br/>
												Доп. сведения о грузовых местах, поддонах и упаковке товаров: 
												<xsl:apply-templates select="whgou:AdditionalPackageInformation"/>
											</xsl:if>
											<xsl:if test="whgou:Container">
												<br/>
												Контейнеры: 
												<xsl:for-each select="whgou:Container">
													<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
													<xsl:apply-templates select="."/>
												</xsl:for-each>
											</xsl:if>
											<xsl:variable name="goodsNum" select="position()"/>
											<xsl:variable name="containerLinks" select="../whgou:GoodContLinks[catWH_ru:GoodNumber = $goodsNum]"/>
											<xsl:if test="count($containerLinks) &gt; 0">
												<br/>
												Контейнеры:
												<xsl:for-each select="$containerLinks">
													<xsl:variable name="containerNum" select="./catWH_ru:ContainerNumber"/>
													<xsl:if test="position()!=1"><xsl:text>; </xsl:text></xsl:if>
													<xsl:apply-templates select="../whgou:Containers[position() = $containerNum]"/>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="whgou:TransportDoc">
												<br/>
												Транспортные документы:  
												<xsl:apply-templates select="whgou:TransportDoc"/>
											</xsl:if>
											<xsl:if test="whgou:GoodsGroupDescription">
												<br/>
												Описание групп товаров одного наименования с отличающимися от других групп характеристиками:
												<xsl:for-each select="whgou:GoodsGroupDescription">
													<xsl:value-of select="position()"/>
													<xsl:text>) </xsl:text>
													<xsl:for-each select="whgou:GoodsDescription">
														<xsl:apply-templates select="."/>
													</xsl:for-each>
													<xsl:if test="position()!=last()">
														<xsl:text>; </xsl:text>
													</xsl:if>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="whgou:DO1GoodLink">
												<br/>
												Указание на товар из отчета о принятии по форме ДО-1: 
												<xsl:for-each select="whgou:DO1GoodLink/*">
													<xsl:if test="position()!=1">, </xsl:if>
													<xsl:choose>
														<xsl:when test="contains(local-name(), 'Date')">
															<xsl:apply-templates mode="russian_date" select="."/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:apply-templates select="."/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="whgou:CustomsDecisionCode">
												<br/>
												Код решения по товару в соответствии с классификатором решений, принимаемых ТО: 
												<xsl:apply-templates select="whgou:CustomsDecisionCode"/>
											</xsl:if>
											<xsl:if test="whgou:DecisionDescription">
												<br/>
												Описание принятого решения: 
												<xsl:apply-templates select="whgou:DecisionDescription"/>
											</xsl:if>
											<xsl:if test="whgou:DecisionDate">
												<br/>
												Дата и время решения: 
												<xsl:apply-templates select="whgou:DecisionDate" mode="russian_date_time"/>
												
											</xsl:if>
										</xsl:for-each>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:180mm;">
										<br/>
										<u> Предоставляемые документы:</u>
										<br/>
										<xsl:apply-templates select="whgou:ProducedDocument"/>
									</td>
								</tr>
							</xsl:for-each>
							<tr>
								<td class="graph" style="width:180mm;">
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
							<xsl:if test="whgou:Comments">
								<tr>
									<td class="graph" style="width:180mm;">
									Комментарии: <xsl:apply-templates select="whgou:Comments"/>
									</td>
								</tr>
								<tr>
									<td class="graph" style="width:180mm;">
										<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
									</td>
								</tr>
							</xsl:if>
							<tr>
								<td class="graph" style="width:180mm;">
									<br/>
									<u> Должностное лицо таможенного органа:</u>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="whgou:CustomsPerson/cat_ru:PersonSurname"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="whgou:CustomsPerson/cat_ru:PersonName"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="whgou:CustomsPerson/cat_ru:PersonMiddleName"/>
									<xsl:text> </xsl:text>
									<xsl:if test="whgou:CustomsPerson/catWH_ru:LNP">ЛНП: 
										<xsl:apply-templates select="whgou:CustomsPerson/catWH_ru:LNP"/>
										<xsl:if test="whgou:CustomsPerson/catWH_ru:CustomsCode">
											<xsl:text> (код ТО: </xsl:text>
											<xsl:value-of select="whgou:CustomsPerson/catWH_ru:CustomsCode"/>
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:if>
									<br/>
									<u> Таможенный орган:</u>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="whgou:Customs/cat_ru:Code"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="whgou:Customs/cat_ru:OfficeName"/>
									<br/>
								</td>
							</tr>
							<tr>
								<td>
									<xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="*[local-name() != 'AddressText' and local-name() != 'AddressKindCode']">
					<xsl:if test="position() != 1">, </xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template match="*" mode="country">
		<xsl:for-each select="*">
			<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="whgou:AdditionalPackageInformation">
		<xsl:if test="whgou:PakageTypeCode">
			<xsl:choose>
				<xsl:when test="whgou:PakageTypeCode=0">
					<xsl:text>Без упаковки</xsl:text>
				</xsl:when>
				<xsl:when test="whgou:PakageTypeCode=1">
					<xsl:text>С упаковкой</xsl:text>
				</xsl:when>
				<xsl:when test="whgou:PakageTypeCode=2">
					<xsl:text>Без упаковки в оборудованных емкостях транспортного средства</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="whgou:PakageTypeCode"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="whgou:PakagePartQuantity">
			<xsl:text>Кол-во грузовых мест, частично занятых товаром: </xsl:text>
			<xsl:value-of select="translate(whgou:PakagePartQuantity, '.', ',')"/>
			<xsl:text> </xsl:text>
		</xsl:if>
		<xsl:if test="whgou:PackagePalleteInformation">
			<xsl:text>Вид груза, количество упаковки товара и описание: </xsl:text>
			<xsl:for-each select="whgou:PackagePalleteInformation">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:if test="whgou:PalleteCode">
					<xsl:value-of select="whgou:PalleteCode"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="whgou:PalleteQuantity">
					<xsl:value-of select="whgou:PalleteQuantity"/>
					<xsl:text> </xsl:text>
				</xsl:if>
				<xsl:if test="whgou:CargoDescriptionText">
					<xsl:apply-templates select="whgou:CargoDescriptionText"/>
					<xsl:text> </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:GTDIDType -->
	<xsl:template match="whgou:RegisterNumber">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates mode="russian_date_gtd" select="cat_ru:RegistrationDate"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="catWH_ru:IdentityCard|whgou:PersonIdCard">
		<xsl:for-each select="*">
			<xsl:if test="position()!=1">, </xsl:if>
			<xsl:choose>
				<xsl:when test="contains(local-name(), 'Date')">
					<xsl:apply-templates mode="russian_date" select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="."/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<!--xsl:apply-templates select="RUScat_ru:IdentityCardCode"/>
		<xsl:apply-templates select="RUScat_ru:IdentityCardName"/>
		<xsl:apply-templates select="RUScat_ru:FullIdentityCardName"/>
		<xsl:apply-templates select="RUScat_ru:IdentityCardSeries"/>
		<xsl:apply-templates select="RUScat_ru:IdentityCardNumber"/-->
		<!--xsl:apply-templates select="cat_ru:RBIdentificationNumber"/-->
		<!--xsl:call-template name="russian_date">
			<xsl:with-param name="dateIn" select="RUScat_ru:IdentityCardDate"/>
		</xsl:call-template>
		<xsl:apply-templates select="RUScat_ru:OrganizationName"/-->
	</xsl:template>
	<!--xsl:template match="catWH_ru:IdentityCard/*">
		<xsl:if test="preceding-sibling::*[1]">,</xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template-->
	<xsl:template match="catWH_ru:BruttoVolQuant | catWH_ru:MeasureQuantity">
		Количество товара: <xsl:apply-templates select="catWH_ru:GoodsQuantity"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="catWH_ru:MeasureUnitQualifierName"/>,
		код единицы измерения: <xsl:apply-templates select="catWH_ru:MeasureUnitQualifierCode"/>
	</xsl:template>
	<xsl:template match="whgou:Containers|whgou:Container">
		<xsl:apply-templates select="catWH_ru:ContainerNumber"/>
		<xsl:if test="catWH_ru:GrossWeightQuantity or catWH_ru:SizeCode or catWH_ru:KindCode">
			<xsl:text> (</xsl:text>
			<xsl:if test="catWH_ru:GrossWeightQuantity">
				<xsl:apply-templates select="catWH_ru:GrossWeightQuantity"/>
				<xsl:text> кг</xsl:text>
			</xsl:if>
			<xsl:if test="catWH_ru:SizeCode">
				<xsl:if test="catWH_ru:GrossWeightQuantity">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>Код размера по ГОСТ 52524-2005: </xsl:text>
				<xsl:apply-templates select="catWH_ru:SizeCode"/>
			</xsl:if>
			<xsl:if test="catWH_ru:KindCode">
				<xsl:if test="catWH_ru:GrossWeightQuantity or catWH_ru:SizeCode">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:text>Код типа по ГОСТ 52524-2005: </xsl:text>
				<xsl:apply-templates select="catWH_ru:KindCode"/>
			</xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:template>
	<xsl:template match="whgou:TransportDoc|whgou:ProducedDocument">
		<span>
			<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			<xsl:if test="cat_ru:PrDocumentNumber">
			№ <xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
			</xsl:if>
			<xsl:if test="cat_ru:PrDocumentDate">
			от 
			<xsl:apply-templates mode="russian_date" select="cat_ru:PrDocumentDate"/>
			</xsl:if>
		</span>; 
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
	<xsl:template name="russian_date_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,6,2)"/>
				<xsl:text>.</xsl:text>
				<xsl:value-of select="substring($dateIn,1,4)"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="substring($dateIn, 12, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_time">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,3,1)=':' and substring($dateIn,6,1)=':'">
				<xsl:value-of select="substring($dateIn, 1, 8)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="//*[local-name()='WHGoodOut']//*" priority="-1">
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
	<xsl:template match="*" mode="russian_date_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_date_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
	</xsl:template>
	<xsl:template match="*" mode="russian_time">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:call-template name="russian_time">
				<xsl:with-param name="dateIn" select="."/>
			</xsl:call-template>
		</element>
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
