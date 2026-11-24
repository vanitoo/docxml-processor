<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:stzm_ac="urn:customs.ru:Information:ExchangeDocuments:STZ_Migrant_AppClose:5.28.0">
	<!-- Шаблон для типа STZ_Migrant_AppCloseType -->
	<xsl:template match="stzm_ac:STZ_Migrant_AppClose">
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
                  .check{
					display:inline-block; 
					width: 5mm; 
					height: 5mm; 
					border: 1px solid black; 
					text-align: center;
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
										<xsl:text>Заявление</xsl:text>
										<br/>
										<xsl:text>о завершении действия таможенной процедуры свободной таможенной зоны в отношении товаров, указанных </xsl:text>
										<xsl:choose>
											<xsl:when test="$regionKind = 1">
												<xsl:text>в части 1 статьи 16.4 Федерального закона от 10 января 2006 г. № 16-ФЗ "Об Особой экономической зоне в Калининградской области и о внесении изменений в некоторые законодательные акты Российской Федерации"</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>в пункте 1 статьи 65.1 Федерального закона от 31 мая 1999 г. № 104-ФЗ "Об Особой экономической зоне в Магаданской области и на территориях Южно-Курильского, Курильского и Северо-Курильского городских округов Сахалинской области"</xsl:text>
											</xsl:otherwise>
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
								</td>
								<td width="50%">
									<b>
										<xsl:text>В</xsl:text>
									</b>
									<br/>
									<xsl:apply-templates select="stzm_ac:Customs"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td align="center" style="border-top: 1px solid black; font-size:8pt;">
									<xsl:text>(наименование и код таможенного органа)</xsl:text>
								</td>
							</tr>
							<tr valign="top">
								<td width="50%"></td>
								<td width="50%">
									<b>
										<xsl:text>От</xsl:text>
									</b>
									<br/>
									<xsl:apply-templates select="stzm_ac:Applicant"/>
								</td>
							</tr>
							<tr>
								<td></td>
								<td align="center" style="border-top: 1px solid black; font-size:8pt;">
									<xsl:text>(лицо, подающее заявление (фамилия, имя, отчество (при наличии), адрес фактического проживания и регистрации физического лица по месту жительства либо по месту пребывания, идентификационный номер налогоплательщика, сведения о документе, удостоверяющем личность физического лица, - для физического лица, полное наименование организации, основной государственный регистрационный номер, идентификационный номер налогоплательщика и код причины постановки на учет в налоговом органе, адрес юридического лица в пределах места нахождения юридического лица - для юридического лица - представителя (далее - заинтересованное лицо)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<p style="text-align: justify;">
						<xsl:text>1. Прошу завершить действие таможенной процедуры свободной таможенной зоны и признать товарами Евразийского экономического союза в соответствии с пунктом 23 статьи 455 Таможенного кодекса Евразийского экономического союза* (далее - ТК ЕАЭС) товары, вывозимые с территории особой экономической зоны, функционирующей на территории</xsl:text>
						<xsl:choose>
							<xsl:when test="$regionKind = 1">
								<xsl:text> Калининградской области</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>:</xsl:text>
								<br/>
								<br/>
								<span class="check">
									<xsl:choose>
										<xsl:when test="$regionKind = 2">v</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span><xsl:text> Магаданской области;</xsl:text>
								<br/>
								<br/>
								<span class="check">
									<xsl:choose>
										<xsl:when test="$regionKind = 3">v</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span><xsl:text> Южно-Курильского городского округа Сахалинской области;</xsl:text>
								<br/>
								<br/>
								<span class="check">
									<xsl:choose>
										<xsl:when test="$regionKind = 4">v</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span><xsl:text> Курильского городского округа Сахалинской области;</xsl:text>
								<br/>
								<br/>
								<span class="check">
									<xsl:choose>
										<xsl:when test="$regionKind = 5">v</xsl:when>
										<xsl:otherwise>-</xsl:otherwise>
									</xsl:choose>
								</span><xsl:text> Северо-Курильского городского округа Сахалинской области</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:choose>
							<xsl:when test="$regionKind = 1">
								<xsl:text>, </xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<br/>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text>в связи с:</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 1">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переселением на постоянное место жительства на остальную часть территории Российской Федерации, за исключением перевода на новое место службы или увольнения в запас;</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 2">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переселением на постоянное место жительства в иное государство - член Евразийского экономического союза, за исключением перевода на новое место службы или увольнения в запас;</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 3">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переводом на новое место службы на остальную часть территории Российской Федерации;</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 4">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переводом на новое место службы в иное государство - член Евразийского экономического союза;</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 5">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переселением на остальную часть территории Российской Федерации в связи с увольнением в запас;</xsl:text>
						<br/>
						<br/>
						<span class="check">
							<xsl:choose>
								<xsl:when test="stzm_ac:BaseForCompletCustProc = 6">v</xsl:when>
								<xsl:otherwise>-</xsl:otherwise>
							</xsl:choose>
						</span><xsl:text> переселением в иное государство - член Евразийского экономического союза в связи с увольнением в запас.</xsl:text>
					</p>
					<br/>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:apply-templates select="stzm_ac:Migrant"/>
								</td>
							</tr>
							<tr>
								<td align="center" style="font-size: 8pt; border-top: 1px solid black;">
									<xsl:text>(физическое лицо, ранее постоянно проживавшее на территории Калининградской области и переселившееся с территории Калининградской области на постоянное место жительства на остальную часть территории Российской Федерации или в иное государство - член Евразийского экономического союза, или военнослужащий, или должностное лицо федерального органа исполнительной власти Российской Федерации, убывающее с территории Калининградской области на новое место службы, с указанием фамилии, имени, отчества (при наличии), адреса фактического проживания и регистрации физического лица по месту жительства либо по месту пребывания, идентификационного номера налогоплательщика, сведений о документе, удостоверяющем личность (наименование, серия, номер)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<p style="text-align: justify;">согласно описи товаров для личного пользования, в том числе автомобилей легковых и прицепов, указанных в абзаце первом пункта 23 статьи 455 ТК ЕАЭС (далее - Товары).</p>
				
					<br/>
					<p>2. Опись товаров</p>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered">Наименование товара (торговое, коммерческое или иное традиционное наименование)</td>
								<td class="bordered">Количество Товара/единица измерения в соответствии с единой Товарной номенклатурой внешнеэкономической деятельности</td>
								<td class="bordered">Идентификационные (отличительные) признаки Товара: серийный номер или другая маркировка производителя Товара, цвет, марка, форма, год выпуска, иные признаки Товара</td>
							</tr>
							<tr align="center">
								<td class="bordered">1</td>
								<td class="bordered">2</td>
								<td class="bordered">3</td>
								<td class="bordered">4</td>
							</tr>
							<xsl:apply-templates select="stzm_ac:GoodsInfo"/>
						</tbody>
					</table>
					<br/>
					<p>3. Товары размещены в зоне таможенного контроля</p>
					<table>
						<tbody>
							<tr>
								<td>
									<xsl:apply-templates select="stzm_ac:CCZ_Address"/>
								</td>
							</tr>
							<tr>
								<td align="center" style="font-size: 8pt; border-top: 1px solid black;">
									<xsl:text>(место нахождения зоны таможенного контроля таможенного органа)</xsl:text>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<p>
						<xsl:text>4. Вывоз товара планируется </xsl:text>
						<table style="table-layout: fixed; display: inline-block;width: 50mm;">
							<tbody>
								<tr>
									<td align="center">
										<xsl:variable name="month" select="stzm_ac:GoodsExportDetails/stzm_ac:ExportDate/stzm_ac:ManufactureMonth"/>
										<xsl:choose>
											<xsl:when test="$month = 1">январь</xsl:when>
											<xsl:when test="$month = 2">февраль</xsl:when>
											<xsl:when test="$month = 3">март</xsl:when>
											<xsl:when test="$month = 4">апрель</xsl:when>
											<xsl:when test="$month = 5">май</xsl:when>
											<xsl:when test="$month = 6">июнь</xsl:when>
											<xsl:when test="$month = 7">июль</xsl:when>
											<xsl:when test="$month = 8">август</xsl:when>
											<xsl:when test="$month = 9">сентябрь</xsl:when>
											<xsl:when test="$month = 10">октябрь</xsl:when>
											<xsl:when test="$month = 11">ноябрь</xsl:when>
											<xsl:when test="$month = 12">декабрь</xsl:when>
										</xsl:choose>
										<xsl:text> </xsl:text>
										<xsl:apply-templates select="stzm_ac:GoodsExportDetails/stzm_ac:ExportDate/stzm_ac:ManufactureYear"/>
									</td>
								</tr>
								<tr>
									<td align="center" style="font-size: 8pt; border-top: 1px solid black;">(месяц, год)</td>
								</tr>
							</tbody>
						</table>
						<xsl:text> в:</xsl:text>
						<table style="table-layout: fixed; width: 100%;">
							<tbody>
								<tr valign="top">
									<td width="50%" style="height: 7mm;">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:ExportMethod = 'СБ'">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> сопровождаемом багаже</xsl:text>
									</td>
									<td width="50%">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:TransportKind = 1">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> автомобильным транспортом</xsl:text>
									</td>
								</tr>
								<tr valign="top">
									<td width="50%" style="height: 7mm">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:ExportMethod = 'НБ'">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> несопровождаемом багаже по договору перевозки</xsl:text>
									</td>
									<td width="50%">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:TransportKind = 2">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> морским транспортом</xsl:text>
									</td>
								</tr>
								<tr valign="top">
									<td width="50%" style="height: 7mm"></td>
									<td width="50%">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:TransportKind = 3">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> авиационным транспортом</xsl:text>
									</td>
								</tr>
								<tr valign="top">
									<td width="50%" style="height: 7mm"></td>
									<td width="50%">
										<span class="check">
											<xsl:choose>
												<xsl:when test="stzm_ac:GoodsExportDetails/stzm_ac:TransportKind = 4">v</xsl:when>
												<xsl:otherwise>-</xsl:otherwise>
											</xsl:choose>
										</span><xsl:text> железнодорожным транспортом</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</p>
					<p style="text-align: justify;">на основании следующих документов, подтверждающих соблюдение условий, установленных пунктом 23 статьи 455 ТК ЕАЭС:</p>
					<table>
						<tbody>
							<tr align="center" valign="top">
								<td class="bordered" width="5%">№ п/п</td>
								<td class="bordered">Наименование документа</td>
								<td class="bordered">Реквизиты (номер, дата) документа</td>
							</tr>
							<xsl:apply-templates select="stzm_ac:PresentedDoc"/>
						</tbody>
					</table>
					<br/>
					<br/>
					<xsl:apply-templates select="stzm_ac:ApplicantSignature"/>
				</div>
			</body>
		</html>
	</xsl:template>
	
	<!-- Шаблон для типа RUScat_ru:RUAddressType -->
	<xsl:template match="stzm_ac:Address|stzm_ac:CCZ_Address">
		<xsl:if test="position()!=1">, </xsl:if>
		<xsl:choose>
			<xsl:when test="RUScat_ru:AddressKindCode = 1">адрес регистрации: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode = 2">адрес фактического проживания: </xsl:when>
			<xsl:when test="RUScat_ru:AddressKindCode = 3">почтовый адрес: </xsl:when>
			<xsl:otherwise>
				<xsl:if test="local-name() = 'Address'">адрес: </xsl:if>
			</xsl:otherwise>
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
	<!-- Шаблон для типа stzm_ac:ApplicantType -->
	<xsl:template match="stzm_ac:Applicant">
		<xsl:choose>
			<xsl:when test="stzm_ac:PersonName">
				<xsl:for-each select="stzm_ac:PersonName/*">
					<xsl:if test="position() != 1">
						<xsl:text> </xsl:text>
					</xsl:if>
					<xsl:apply-templates select="."/>
				</xsl:for-each>
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="stzm_ac:Address"/>
				<xsl:text>, </xsl:text>
				<xsl:text>ИНН </xsl:text>
				<xsl:apply-templates select="stzm_ac:INN"/>
				<xsl:if test="stzm_ac:IdentityCard">
					<xsl:text>, </xsl:text>
					<xsl:apply-templates select="stzm_ac:IdentityCard"/>
				</xsl:if>
			</xsl:when>
			<xsl:when test="stzm_ac:OrganizationName">
				<xsl:apply-templates select="stzm_ac:OrganizationName"/>
				<xsl:if test="stzm_ac:OGRN">
					<xsl:text>, ОГРН </xsl:text>
					<xsl:apply-templates select="stzm_ac:OGRN"/>
				</xsl:if>
				<xsl:text>, ИНН </xsl:text>
				<xsl:apply-templates select="stzm_ac:INN"/>
				<xsl:if test="stzm_ac:KPP">
					<xsl:text>, КПП </xsl:text>
					<xsl:apply-templates select="stzm_ac:KPP"/>
				</xsl:if>
				<xsl:text>, </xsl:text>
				<xsl:apply-templates select="stzm_ac:Address"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
	<!-- Шаблон для типа cat_ru:PersonSignatureType -->
	<xsl:template match="stzm_ac:ApplicantSignature">
		<table>
			<tbody>
				<tr>
					<td align="center" width="50%">
						<xsl:for-each select="*[contains(translate(local-name(), 'name', 'NAME'), 'NAME')]">
							<xsl:if test="position() != 1">
								<xsl:text> </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="."/>
						</xsl:for-each>
					</td>
					<td width="10%"></td>
					<td align="right" width="30%">
						<xsl:apply-templates select="*[local-name() = 'IssueDate']" mode="russian_date"/>
					</td>
				</tr>
				<tr align="center">
					<td style="font-size: 8pt; border-top: 1px solid black;">(фамилия, имя, отчество (при наличии) заинтересованного лица)</td>
					<td></td>
					<td style="font-size: 8pt; border-top: 1px solid black;">(подпись, дата)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:AutomobileInfoType -->
	<xsl:template match="stzm_ac:AutomobileInfo">
		
		<xsl:if test="stzm_ac:Model">
			<xsl:text>, модель: </xsl:text><xsl:apply-templates select="stzm_ac:Model"/>
		</xsl:if>
		<xsl:if test="stzm_ac:Mark">
			<xsl:text>, марка: </xsl:text><xsl:apply-templates select="stzm_ac:Mark"/>
		</xsl:if>
		<xsl:if test="stzm_ac:MarkCode">
			<xsl:text>, код марки: </xsl:text><xsl:apply-templates select="stzm_ac:MarkCode"/>
		</xsl:if>
		<xsl:if test="stzm_ac:ManufactureDate">
			<xsl:text>, дата производства: </xsl:text><xsl:apply-templates select="stzm_ac:ManufactureDate" mode="russian_date"/>
		</xsl:if>
		<xsl:if test="stzm_ac:ManufactureYear">
			<xsl:text>, год выпуска: </xsl:text><xsl:apply-templates select="stzm_ac:ManufactureYear"/>
		</xsl:if>
		<xsl:if test="stzm_ac:ManufactureMonth">
			<xsl:text>, месяц выпуска: </xsl:text><xsl:apply-templates select="stzm_ac:ManufactureMonth"/>
		</xsl:if>
		<xsl:if test="stzm_ac:EngineVolumeQuanity">
			<xsl:text>, объем двигателя (куб.см): </xsl:text><xsl:apply-templates select="stzm_ac:EngineVolumeQuanity" mode="translate_number"/>
		</xsl:if>
		<xsl:if test="stzm_ac:VINID">
			<xsl:text>, VIN: </xsl:text><xsl:apply-templates select="stzm_ac:VINID"/>
		</xsl:if>
		<xsl:if test="stzm_ac:VINChassisID">
			<xsl:text>, ID рамы (шасси): </xsl:text><xsl:apply-templates select="stzm_ac:VINChassisID"/>
		</xsl:if>
		<xsl:if test="stzm_ac:VINBodyID">
			<xsl:text>, ID кузова (кабины): </xsl:text><xsl:apply-templates select="stzm_ac:VINBodyID"/>
		</xsl:if>
		<xsl:if test="stzm_ac:TransportCategoryCode">
			<xsl:text>, код категории: </xsl:text><xsl:apply-templates select="stzm_ac:TransportCategoryCode"/>
		</xsl:if>
		<xsl:if test="stzm_ac:TransportTypeName">
			<xsl:text>, наименование: </xsl:text><xsl:apply-templates select="stzm_ac:TransportTypeName"/>
		</xsl:if>
		<xsl:if test="stzm_ac:TransportColorCode">
			<xsl:text>, код цвета: </xsl:text><xsl:apply-templates select="stzm_ac:TransportColorCode"/>
		</xsl:if>
		<xsl:if test="stzm_ac:ColorListElement">
			<xsl:text>, код цвета элементов: </xsl:text>
			<xsl:for-each select="stzm_ac:ColorListElement">
				<xsl:if test="position()!=1">, </xsl:if>
				<xsl:value-of select="."/>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="stzm_ac:ECOClassCode">
			<xsl:text>, эко: </xsl:text><xsl:apply-templates select="stzm_ac:ECOClassCode"/>
		</xsl:if>
		<xsl:if test="stzm_ac:EngineId">
			<xsl:text>, ID двигателя: </xsl:text><xsl:apply-templates select="stzm_ac:EngineId"/>
		</xsl:if>
		<xsl:if test="stzm_ac:CapacityQuantity">
			<xsl:text>, вместимость: </xsl:text><xsl:apply-templates select="stzm_ac:CapacityQuantity"/>
		</xsl:if>
		<xsl:if test="stzm_ac:OrganizationName">
			<xsl:text>, организация-изготовитель: </xsl:text><xsl:apply-templates select="stzm_ac:OrganizationName"/>
		</xsl:if>
		<xsl:if test="stzm_ac:UnifiedCountryCode">
			<xsl:text>, страна-изготовитель: </xsl:text><xsl:apply-templates select="stzm_ac:UnifiedCountryCode"/>
		</xsl:if>
		<xsl:if test="stzm_ac:TransportMeansRegId">
			<xsl:text>, рег.номер: </xsl:text><xsl:apply-templates select="stzm_ac:TransportMeansRegId"/>
		</xsl:if>

	</xsl:template>
	<!-- Шаблон для типа cat_ru:CustomsType -->
	<xsl:template match="stzm_ac:Customs">
		<xsl:apply-templates select="cat_ru:OfficeName"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:Code"/>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:EngineType -->
	<xsl:template match="stzm_ac:Engine">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<tr>
				<td class="graphMain bordered">
					<xsl:choose>
						<xsl:when test="stzm_ac:EngineModeCode='1'">
							<xsl:text>бензиновый</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='2'">
							<xsl:text>дизельный</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='3'">
							<xsl:text>электрический</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='4'">
							<xsl:text>гибридный на основе бензинового</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='5'">
							<xsl:text>гибридный на основе дизельного</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='6'">
							<xsl:text>конв</xsl:text>
						</xsl:when>
						<xsl:when test="stzm_ac:EngineModeCode='7'">
							<xsl:text>иной</xsl:text>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="stzm_ac:EngineModeCode"/>
						</xsl:otherwise>
					</xsl:choose>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_ac:EngineModeName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_ac:EngineModel"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_ac:FuelName"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_ac:EnginePowerHpQuanity" mode="translate_number"/>
				</td>
				<td class="graphMain bordered">
					<xsl:apply-templates select="stzm_ac:EnginePowerKvtQuanity" mode="translate_number"/>
				</td>
			</tr>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:ExportDateType -->
	<xsl:template match="stzm_ac:ExportDate">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="stzm_ac:ManufactureDate">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Дата вывоза</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stzm_ac:ManufactureDate" mode="russian_date"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="stzm_ac:ManufactureYear">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Год вывоза</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stzm_ac:ManufactureYear"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="stzm_ac:ManufactureMonth">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Месяц вывоза</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="stzm_ac:ManufactureMonth"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:GoodsExportDetailsType -->
	<xsl:template match="stzm_ac:GoodsExportDetails">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="stzm_ac:ExportDate">
				<div class="title marg-top">Планируемая дата вывоза товаров для личного пользования</div>
				<div>
					<xsl:apply-templates select="stzm_ac:ExportDate">
						<xsl:with-param name="wdth" select="$w"/>
					</xsl:apply-templates>
				</div>
			</xsl:if>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Способ вывоза товаров для личного пользования: СБ - в сопровождаемом багаже, НБ - в несопровождаемом багаже по договору перевозки</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="stzm_ac:ExportMethod='СБ'">
								<xsl:text>в сопровождаемом багаже</xsl:text>
							</xsl:when>
							<xsl:when test="stzm_ac:ExportMethod='НБ'">
								<xsl:text>в несопровождаемом багаже по договору перевозки</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="stzm_ac:ExportMethod"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td class="annot graphMain" style="width:50%">Вид транспорта, которым вывозятся товары: 1 - автомобильным транспортом; 2 - морским транспортом; 3 - авиационным транспортом; 4 - железнодорожным транспортом</td>
					<td class="value graphMain" style="width:50%">
						<xsl:choose>
							<xsl:when test="stzm_ac:TransportKind='1'">
								<xsl:text>автомобильным транспортом</xsl:text>
							</xsl:when>
							<xsl:when test="stzm_ac:TransportKind='2'">
								<xsl:text>морским транспортом</xsl:text>
							</xsl:when>
							<xsl:when test="stzm_ac:TransportKind='3'">
								<xsl:text>авиационным транспортом</xsl:text>
							</xsl:when>
							<xsl:when test="stzm_ac:TransportKind='4'">
								<xsl:text>железнодорожным транспортом</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="stzm_ac:TransportKind"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</table>
		</div>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:GoodsInfoType -->
	<xsl:template match="stzm_ac:GoodsInfo">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_ac:NumPP"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_ac:GoodsDescription"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_ac:SupplementaryQuantity"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_ac:Manufacturer"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:TradeMark"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:GoodsMark"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:GoodsMarking"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:GoodsStandard"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:OriginCountryCode"/>
				<xsl:text> </xsl:text>
				<xsl:apply-templates select="stzm_ac:AutomobileInfo"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="stzm_ac:IdentityCard">

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
	<!-- Шаблон для типа stzm_ac:MigrantType -->
	<xsl:template match="stzm_ac:Migrant">
		<xsl:for-each select="*[contains(translate(local-name(), 'name', 'NAME'), 'NAME')]">
			<xsl:if test="position() != 1">
				<xsl:text> </xsl:text>
			</xsl:if>
			<xsl:apply-templates select="."/>
		</xsl:for-each>
		<xsl:text>, </xsl:text>
		<xsl:apply-templates select="stzm_ac:Address"/>
		<xsl:text>, </xsl:text>
		<xsl:text>ИНН </xsl:text>
		<xsl:apply-templates select="stzm_ac:INN"/>
		<xsl:if test="stzm_ac:IdentityCard">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="stzm_ac:IdentityCard"/>
		</xsl:if>
	</xsl:template>
	<!-- Шаблон для типа stzm_ac:PresentedDocType -->
	<xsl:template match="stzm_ac:PresentedDoc">
		<tr>
			<td class="graphMain bordered">
				<xsl:apply-templates select="stzm_ac:Position"/>
			</td>
			<td class="graphMain bordered">
				<xsl:apply-templates select="cat_ru:PrDocumentName"/>
			</td>
			<td class="graphMain bordered">
				<xsl:if test="cat_ru:PrDocumentNumber">
					<xsl:text>№ </xsl:text>
					<xsl:apply-templates select="cat_ru:PrDocumentNumber"/>
				</xsl:if>
				<xsl:if test="cat_ru:PrDocumentDate">
					<xsl:text> от </xsl:text>
					<xsl:apply-templates select="cat_ru:PrDocumentDate" mode="russian_date"/>
				</xsl:if>
			</td>
		</tr>
	</xsl:template>
	<!-- Шаблон для типа catESAD_cu:RFBasePresentedDocIDType -->
	<xsl:template match="stzm_ac:RFPresentedDocIDType">
		<xsl:param name="wdth" select="0"/>
		<xsl:variable name="w" select="$wdth - 5"/>
		<div style="width:100%; min-width:{$w}mm; max-width:{$w}mm; padding-left:5mm;">
			<xsl:if test="catESAD_cu:ElectronicDocumentID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор документа, присвоенный информационной системой таможенных органов при представлении документа в электронном виде</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicDocumentID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:ElectronicArchID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Идентификатор хранилища электронных документов при представлении документа в электронном виде</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:ElectronicArchID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
			<xsl:if test="catESAD_cu:DocumentModeID">
				<table>
					<tr>
						<td class="annot graphMain" style="width:50%">Код вида представленного документа в соответствии с альбомом форматов электронных форм документов</td>
						<td class="value graphMain" style="width:50%">
							<xsl:apply-templates select="catESAD_cu:DocumentModeID"/>
						</td>
					</tr>
				</table>
			</xsl:if>
		</div>
	</xsl:template>
	<!-- Шаблон для типа cat_ru:SupplementaryQuantityType -->
	<xsl:template match="stzm_ac:SupplementaryQuantity">
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
	<xsl:template match="stzm_ac:TransportMeansRegId">
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
	<xsl:template match="//*[local-name()='STZ_Migrant_AppClose']//*" priority="-1">
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
