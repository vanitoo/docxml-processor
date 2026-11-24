<?xml version="1.0" encoding="utf-8"?>
<!-- Новый Приказ ФТС России вместо Приказа от 21.11.2018 г. № 1876 "Об утверждении форм документов, применяемых таможенными органами в целях обеспечения взыскания таможенных платежей,
специальных, антидемпинговых, компенсационных пошлин, процентов и пеней за счет имущества и обращения взыскания на товары":
Приложение 6 (DocKind = 1) - Протокол таможенного органа Российской Федерации о наложении ареста на имущество.
Приложение 10 (DocKind = 2) - Протокол таможенного органа Российской Федерации о наложении ареста на товары.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:pimar="urn:customs.ru:Information:CustomsAuditDocuments:ProtocolImpositionArrest:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:RUSclt_ru="urn:customs.ru:RUSCommonLeafTypes:5.21.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<!-- Шаблон для типа ProtocolImpositionArrestType -->
	<xsl:template match="pimar:ProtocolImpositionArrest">
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
				<xsl:apply-templates select="pimar:DocumentInfo[pimar:DocKind = 1]"><xsl:with-param name="w" select="$w"/></xsl:apply-templates> <!-- имущество -->
				<xsl:apply-templates select="pimar:DocumentInfo[pimar:DocKind = 2]"><xsl:with-param name="w" select="$w"/></xsl:apply-templates> <!-- товары -->
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="pimar:DocumentInfo[pimar:DocKind = 1]">
		<xsl:param name="w"/>
		<div class="page" style="width: {$w}mm;">
			<table>
				<tbody>
					<tr>
						<td align="center">
							<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
							<br/>
							<table class="inlinetable" style="min-width: 80%; width: 80%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="pimar:CustomsOffice/*" mode="splitSpace"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(наименование таможенного органа Российской Федерации)
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<b>
								<xsl:text>Протокол таможенного органа Российской Федерации</xsl:text>
								<br/>
								<xsl:text>о наложении ареста на имущество</xsl:text>
							</b>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody>
					<tr>
						<td width="40%" align="left">
							<xsl:text>от </xsl:text>
							<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:RequisitesDocument/cat_ru:PrDocumentDate"/></xsl:call-template>
						</td>
						<td width="20%"></td>
						<td width="40%" align="right">
							<xsl:text>№ </xsl:text>
							<span style="display: inline-block; width:50mm; border-bottom: 1px solid black;">
								<xsl:apply-templates select="pimar:RequisitesDocument/cat_ru:PrDocumentNumber"/>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/></td>
					</tr>
					<tr>
						<td width="40%" align="left">
							<xsl:text>Начало: </xsl:text>
							<xsl:call-template name="time">
								<xsl:with-param name="date" select="pimar:StartDate"/>
							</xsl:call-template>
						</td>
						<td width="20%"></td>
						<td width="40%" align="right">
							<xsl:text>Окончание: </xsl:text>
							<xsl:call-template name="time">
								<xsl:with-param name="date" select="pimar:EndDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:apply-templates select="pimar:CompilationPlase"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(место составления)
						</td>
					</tr>
				</tbody>
			</table>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:if test="pimar:CustomsPerson/cat_ru:PersonPost">
								<xsl:apply-templates select="pimar:CustomsPerson/cat_ru:PersonPost"/>
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="pimar:CustomsPerson" mode="personFIO"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div>с участием понятых и специалистов:</div>
			<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 1 or pimar:PersonRole = 2]" mode="personRole"/>
			<div>в присутствии:</div>
			<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 3]" mode="personRole"/>
			<br/>
			<div>с применением видеозаписи: </div>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:apply-templates select="pimar:VideoInf"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(сведения о технических средства, использованных для проведения видеозаписи)
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div>
				<xsl:text>
				на основании части 27 статьи 78 Федерального закона от 3 августа 2018 г. №289-ФЗ "О таможенном прегулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты 
				Российской Федерации" и в соответствии с принятым решением таможенного органа Российской Федерации о наложении ареста на имущество</xsl:text>
				<br/>
				<xsl:text>от </xsl:text> 
				<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:ArrestDecision/cat_ru:PrDocumentDate"/></xsl:call-template>
				<xsl:text> № </xsl:text>
				<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
					<xsl:apply-templates select="pimar:ArrestDecision/cat_ru:PrDocumentNumber"/>
				</span>
				<xsl:text> наложен </xsl:text>
				<table class="inlinetable" style="min-width: 40mm; width: 40mm;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:apply-templates select="pimar:ArrestKind"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(полный или частичный)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text> арест на имущество</xsl:text>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:OwnerOrganization" mode="org"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(сведения о лице, на имущество которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика;
								для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицам, участвующим в производстве ареста имущества в качестве понятых, специалистов, а так же собственнику имущества, его представителю разъяснены их права и обязанности.</xsl:text>
				</p>
				<p style="text-indent: 5mm;">
					<xsl:text>Права разъяснены и понятны</xsl:text><sup>1</sup><xsl:text>:</xsl:text>
				</p>
				<xsl:for-each select="pimar:Persons[pimar:PersonRole = 1 or pimar:PersonRole = 2] | pimar:OwnerOrgPerson">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<table class="inlinetable" style="min-width: 30%; width: 30%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="pimar:ConsentSign"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(полный или частичный)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text> </xsl:text>
					<table class="inlinetable" style="min-width: 65%; width: 65%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="." mode="personFIO"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(фамилия, имя, отчество (при наличии)
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
				<p style="text-indent: 5mm;">
					<xsl:text>Описи и аресту подвергнуто следующее имущество:</xsl:text>
				</p>
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="bordered">№ п/п</td>
							<td class="bordered">Наименование</td>
							<td class="bordered">Количество (ед.изм.)</td>
							<td class="bordered">Индивидуальные признаки</td>
							<td class="bordered">Стоимость (руб.) <sup>2</sup></td>
						</tr>
						<xsl:for-each select="pimar:ListArrest">
							<xsl:sort select="pimar:SerialNumber" order="ascending" data-type="number"/>
							<tr valign="top">
								<td class="bordered">
									<xsl:apply-templates select="pimar:SerialNumber"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:NameProperty"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:Quantitypoint"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pimar:MeasureUnitOperation"/>
									<xsl:if test="pimar:MeasureUnitOperationCode">
										<xsl:text> (</xsl:text>
										<xsl:apply-templates select="pimar:MeasureUnitOperationCode"/>
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:Characteristics"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:CostProperty"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<p style="text-indent: 5mm;">
					<xsl:text>Всего описано имущества на сумму </xsl:text>
					<span style="display: inline-block; width: 40mm; border-bottom: 1px solid black;">
						<xsl:apply-templates select="pimar:TotalCost"/>
					</span>
					<xsl:text> рублей</xsl:text><sup>3</sup><xsl:text>.</xsl:text>
				</p>
				<p style="text-indent: 5mm;">
					<xsl:text>Указанное в настоящем протоколе имущество изъято  и передано на хранение</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(фамилия, имя, отчество (при наличии) лица, которому передано под охрану или на хранение изъятое имущество, должность, реквизиты документ, удостоверяющего личность, номер и дата доверенности)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>, </xsl:text>
				<p>
					<xsl:text>арестованное имущество должно находиться у</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperOrganization"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(наименование организации, адрес и место хранения арестованного имущества)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>.</xsl:text>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицу, которому передано под охрану или на хранение арестованное имущество, обязанности разъяснены.</xsl:text>
					<br/>
					<xsl:text>Об ответственности, предусмотренной статьей 312 Уголовного кодекса Российской Федерации за растрату, отчуждение, сокрытие или незаконную передачу имущества, подвергнутого аресту, совершенноые лицом, которому это имущество вверено, предпрежден</xsl:text>
					<sup>4</sup>
					<xsl:text>:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 30%; width: 30%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:ConsentSign"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(подпись)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text></xsl:text>
				<table class="inlinetable" style="min-width: 69%; width: 69%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson" mode="personFIO"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(фамилия, имя, отчество (при наличии),
							</td>
						</tr>
					</tbody>
				</table>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:text> документ: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:IdentityCard" mode="identity"/>
								<xsl:text>, адрес регистрации: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:RegAddress" mode="address"/>
								<xsl:if test="pimar:KeeperPerson/FactAddress">
									<xsl:text>, адрес фактического проживания: </xsl:text>
									<xsl:apply-templates select="pimar:KeeperPerson/FactAddress" mode="address"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								реквизиты документа, удостоверяющего личность, адрес регистрации и фактического проживания<sup>5</sup>)
							</td>
						</tr>
					</tbody>
				</table>
				<p style="text-indent: 5mm;">
					<xsl:text>Заявления, замечания лиц, присутствующих при производстве ареста имущества</xsl:text>
					<sup>6</sup>
					<xsl:text>:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:choose>
									<xsl:when test="not(pimar:StatementsComments)">Замечаний нет</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="pimar:StatementsComments"/>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>.</xsl:text>
				<br/>
				<table>
					<tbody>
						<tr valign="top">
							<td width="20%">Приложения:</td>
							<td width="80%">
								<xsl:text>1. Копия решения таможенного органа о наложении ареста на имущество от </xsl:text>
								<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:ArrestDecision/cat_ru:PrDocumentDate"/></xsl:call-template>
								<xsl:text> на </xsl:text>
								<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black;">
									<xsl:apply-templates select="pimar:ArrestDecision/pimar:SheetsNumber"/>
								</span>
								<xsl:text>листах.</xsl:text>
								<br/>
								<xsl:text>2. Материалы видеозаписи, прилагаемые к настоящему протоколу.</xsl:text>
								<br/>
								<xsl:text>3. Иные документы, замечания, объяснения, поступившие во время оставления протокола: </xsl:text>
								<xsl:apply-templates select="pimar:OtherDocStatementsComments"/>
								<xsl:text>.</xsl:text>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr valign="bottom">
							<td width="30%" style="border-bottom: 1px solid black;">
								Должностное лицо
								<br/>
								таможенного органа
								<br/>
								Российской Федерации
								<br/>
								<br/>
								<xsl:apply-templates select="pimar:CustomsPerson/cat_ru:PersonPost"/>
							</td>
							<td width="5%"/>
							<td width="20%" style="border-bottom: 1px solid black;"></td>
							<td width="5%"/>
							<td width="40%" align="center" style="border-bottom: 1px solid black;">
								<xsl:apply-templates select="pimar:CustomsPerson" mode="personFIO"/>
							</td>
						</tr>
						<tr class="descr">
							<td>(должность)</td>
							<td></td>
							<td>(подпись)</td>
							<td></td>
							<td>(фамилия, имя, отчество(при наличии)</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицо (представитель лица), на имущество которого налагается арест:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="personFamilyIO"/>
								<xsl:if test="pimar:OwnerOrgPerson/cat_ru:PersonPost">
									<xsl:text>, </xsl:text>
									<xsl:apply-templates select="pimar:OwnerOrgPerson/cat_ru:PersonPost"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(наименование организации (фамилия, инициалы индивидуального предпринимателя), должность лица,
							</td>
						</tr>
						<tr align="left">
							<td class="value">
								<xsl:text>документ, удостоверящий личность: </xsl:text>
								<xsl:apply-templates select="pimar:OwnerOrgPerson/pimar:IdentityCard" mode="identity"/>
								<xsl:if test="pimar:OwnerOrgPerson/pimar:PowerOfAttorney">
									<br/>
									<xsl:text>документ, подтверждающий полномочия: </xsl:text>
									<xsl:apply-templates select="pimar:OwnerOrgPerson/pimar:PowerOfAttorney" mode="attorney"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								реквизиты документа, удостоверяющего личность (реквизиты документа, подтверждающего полномочия лица (при наличии)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="signatureFIO"/>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Представитель организации, осуществляющей хранение арестованного имущества:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:if test="pimar:KeeperOrgPerson/cat_ru:PersonPost">
									<xsl:apply-templates select="pimar:KeeperOrgPerson/cat_ru:PersonPost"/>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:text>документ, удостоверящий личность: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperOrgPerson/pimar:IdentityCard" mode="identity"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(должность, реквизиты документа, удостоверяющего личность
							</td>
						</tr>
						<tr align="left">
							<td class="value">
								<xsl:text>документ, подтверждающий полномочия: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperOrgPerson/pimar:PowerOfAttorney" mode="attorney"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(реквизиты документа, подтверждающего полномочия представителя лица
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:apply-templates select="pimar:KeeperOrgPerson" mode="signatureFIO"/>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr>
							<td class="bordered" align="center">
								<xsl:text>(данный раздел заполняется в случае, если арест имущества производится без применения видеозаписи)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<xsl:text>Понятые</xsl:text><sup>7</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 1]" mode="signatureFIO"/>
								<br/>
								<xsl:text>Специалисты</xsl:text><sup>8</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 2]" mode="signatureFIO"/>
								<br/>
								<xsl:text>Иные лица, присутствующие при аресте имущества</xsl:text><sup>9</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 3]" mode="signatureFIO"/>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Копию настоящего протокола таможенного органа о наложении ареста на имущество получил:</xsl:text>
					<table class="inlinetable" style="min-width: 50%; width: 50%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="pimar:OwnerOrgPerson/cat_ru:PersonPost"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(доложность лица (представителя лица), на имущество которого наложен арест имущества)
								</td>
							</tr>
						</tbody>
					</table>
				</p>
				<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="signatureFIO"/>
				
				<br/>
				<br/>
				<div style="font-size: 8pt;">
					<sup>1</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>2</sup><xsl:text> Указывается при возможности.</xsl:text>
					<br/>
					<sup>3</sup><xsl:text> Заполняется в случае указания стоимости имущества.</xsl:text>
					<br/>
					<sup>4</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>5</sup><xsl:text> Адрес фактического проживания указывается при наличии.</xsl:text>
					<br/>
					<sup>6</sup><xsl:text> При отсутствии замечаний вносится запись "Замечаний нет".</xsl:text>
					<br/>
					<sup>7</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>8</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>9</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
				</div>
			</div>
		</div>
	</xsl:template>
		
	<xsl:template match="pimar:DocumentInfo[pimar:DocKind = 2]">
		<xsl:param name="w"/>
		<div class="page" style="width: {$w}mm;">
			<table>
				<tbody>
					<tr>
						<td align="center">
							<xsl:text>ФЕДЕРАЛЬНАЯ ТАМОЖЕННАЯ СЛУЖБА</xsl:text>
							<br/>
							<table class="inlinetable" style="min-width: 80%; width: 80%;">
								<tbody>
									<tr align="center">
										<td class="value">
											<xsl:apply-templates select="pimar:CustomsOffice/*" mode="splitSpace"/>
											<br/>
										</td>
									</tr>
									<tr align="center">
										<td class="descr">
											(наименование таможенного органа Российской Федерации)
										</td>
									</tr>
								</tbody>
							</table>
							<br/>
							<br/>
							<b>
								<xsl:text>Протокол таможенного органа Российской Федерации</xsl:text>
								<br/>
								<xsl:text>о наложении ареста на товары</xsl:text>
							</b>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table>
				<tbody>
					<tr>
						<td width="40%" align="left">
							<xsl:text>от </xsl:text>
							<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:RequisitesDocument/cat_ru:PrDocumentDate"/></xsl:call-template>
						</td>
						<td width="20%"></td>
						<td width="40%" align="right">
							<xsl:text>№ </xsl:text>
							<span style="display: inline-block; width:50mm; border-bottom: 1px solid black;">
								<xsl:apply-templates select="pimar:RequisitesDocument/cat_ru:PrDocumentNumber"/>
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="3"><br/></td>
					</tr>
					<tr>
						<td width="40%" align="left">
							<xsl:text>Начало: </xsl:text>
							<xsl:call-template name="time">
								<xsl:with-param name="date" select="pimar:StartDate"/>
							</xsl:call-template>
						</td>
						<td width="20%"></td>
						<td width="40%" align="right">
							<xsl:text>Окончание: </xsl:text>
							<xsl:call-template name="time">
								<xsl:with-param name="date" select="pimar:EndDate"/>
							</xsl:call-template>
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<br/>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:apply-templates select="pimar:CompilationPlase"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(место составления)
						</td>
					</tr>
				</tbody>
			</table>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:if test="pimar:CustomsPerson/cat_ru:PersonPost">
								<xsl:apply-templates select="pimar:CustomsPerson/cat_ru:PersonPost"/>
								<xsl:text>, </xsl:text>
							</xsl:if>
							<xsl:apply-templates select="pimar:CustomsPerson" mode="personFIO"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(должность, фамилия, имя, отчество (при наличии) должностного лица таможенного органа)
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div>с участием понятых и специалистов:</div>
			<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 1 or pimar:PersonRole = 2]" mode="personRole"/>
			<div>в присутствии:</div>
			<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 3]" mode="personRole"/>
			<br/>
			<div>с применением видеозаписи: </div>
			<table class="inlinetable" style="min-width: 100%; width: 100%;">
				<tbody>
					<tr align="center">
						<td class="value">
							<xsl:apply-templates select="pimar:VideoInf"/>
							<br/>
						</td>
					</tr>
					<tr align="center">
						<td class="descr">
							(сведения о технических средства, использованных для проведения видеозаписи)
						</td>
					</tr>
				</tbody>
			</table>
			<br/>
			<div>
				<xsl:text>
				на основании части 27 статьи 78 Федерального закона от 3 августа 2018 г. №289-ФЗ "О таможенном прегулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты 
				Российской Федерации" и в соответствии с принятым решением таможенного органа Российской Федерации о наложении ареста на товары</xsl:text>
				<br/>
				<xsl:text>от </xsl:text> 
				<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:ArrestDecision/cat_ru:PrDocumentDate"/></xsl:call-template>
				<xsl:text> № </xsl:text>
				<span style="display: inline-block; width: 30mm; border-bottom: 1px solid black;">
					<xsl:apply-templates select="pimar:ArrestDecision/cat_ru:PrDocumentNumber"/>
				</span>
				<xsl:text> наложен арест на товары</xsl:text>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:if test="not(pimar:OwnerOrgPerson)">сведения о плательщике отсутствуют</xsl:if>
								<xsl:apply-templates select="pimar:OwnerOrganization" mode="org"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(сведения о лице, на товары которого наложен арест: для юридического лица - полное наименование организации, адрес (место нахождения), идентификационный номер налогоплательщика;
								для индивидуального предпринимателя - фамилия, имя, отчество (при наличии), адрес (место нахождения), идентификационный номер налогоплательщика)<sup>1</sup>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицам, участвующим в производстве ареста товаров в качестве понятых, специалистов, а так же собственнику товаров, его представителю разъяснены их права и обязанности.</xsl:text>
				</p>
				<p style="text-indent: 5mm;">
					<xsl:text>Права разъяснены и понятны</xsl:text><sup>2</sup><xsl:text>:</xsl:text>
				</p>
				<xsl:for-each select="pimar:Persons[pimar:PersonRole = 1 or pimar:PersonRole = 2] | pimar:OwnerOrgPerson">
					<xsl:if test="position() != 1"><br/></xsl:if>
					<xsl:value-of select="position()"/>
					<xsl:text>. </xsl:text>
					<table class="inlinetable" style="min-width: 30%; width: 30%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="pimar:ConsentSign"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(полный или частичный)
								</td>
							</tr>
						</tbody>
					</table>
					<xsl:text> </xsl:text>
					<table class="inlinetable" style="min-width: 65%; width: 65%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="." mode="personFIO"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(фамилия, имя, отчество (при наличии)
								</td>
							</tr>
						</tbody>
					</table>
				</xsl:for-each>
				<p style="text-indent: 5mm;">
					<xsl:text>Описи и аресту подвергнуты следующие товары:</xsl:text>
				</p>
				<table>
					<tbody>
						<tr align="center" valign="top">
							<td class="bordered">№ п/п</td>
							<td class="bordered">Наименование</td>
							<td class="bordered">Количество (ед.изм.)</td>
							<td class="bordered">Индивидуальные признаки</td>
							<td class="bordered">Стоимость (руб.) <sup>3</sup></td>
						</tr>
						<xsl:for-each select="pimar:ListArrest">
							<xsl:sort select="pimar:SerialNumber" order="ascending" data-type="number"/>
							<tr valign="top">
								<td class="bordered">
									<xsl:apply-templates select="pimar:SerialNumber"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:NameProperty"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:Quantitypoint"/>
									<xsl:text> </xsl:text>
									<xsl:apply-templates select="pimar:MeasureUnitOperation"/>
									<xsl:if test="pimar:MeasureUnitOperationCode">
										<xsl:text> (</xsl:text>
										<xsl:apply-templates select="pimar:MeasureUnitOperationCode"/>
										<xsl:text>)</xsl:text>
									</xsl:if>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:Characteristics"/>
								</td>
								<td class="bordered">
									<xsl:apply-templates select="pimar:CostProperty"/>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
				<p style="text-indent: 5mm;">
					<xsl:text>Всего описано товаров на сумму </xsl:text>
					<span style="display: inline-block; width: 40mm; border-bottom: 1px solid black;">
						<xsl:apply-templates select="pimar:TotalCost"/>
					</span>
					<xsl:text> рублей</xsl:text><sup>4</sup><xsl:text>.</xsl:text>
				</p>
				<p style="text-indent: 5mm;">
					<xsl:text>Указанные в настоящем протоколе товары изъяты  и передано на хранение</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(фамилия, имя, отчество (при наличии) лица, которому передано под охрану или на хранение изъятые товары, должность, реквизиты документ, удостоверяющего личность, номер и дата доверенности)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>, </xsl:text>
				<p>
					<xsl:text>арестованные товары должны находиться у</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperOrganization"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(наименование организации, адрес и место хранения арестованных товаров)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>.</xsl:text>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицу, которому передано под охрану или на хранение арестованное имущество, обязанности разъяснены.</xsl:text>
					<br/>
					<xsl:text>Об ответственности, предусмотренной статьей 312 Уголовного кодекса Российской Федерации, частью 2 статьи 16.20 Кодекса Российской Федерации об административных правонарушениях, за пользование арестованными товарами без разрешения таможенного органа, растрату, отчуждение, сокрытие или незаконную передачу товаров, подвергнутых аресту, совершенноые лицом, которому эти товары вверены, предпрежден</xsl:text>
					<xsl:text>:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 30%; width: 30%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:ConsentSign"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(подпись)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text></xsl:text>
				<table class="inlinetable" style="min-width: 69%; width: 69%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:apply-templates select="pimar:KeeperPerson" mode="personFIO"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(фамилия, имя, отчество (при наличии),
							</td>
						</tr>
					</tbody>
				</table>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="center">
							<td class="value">
								<xsl:text> документ: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:IdentityCard" mode="identity"/>
								<xsl:text>, адрес регистрации: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperPerson/pimar:RegAddress" mode="address"/>
								<xsl:if test="pimar:KeeperPerson/FactAddress">
									<xsl:text>, адрес фактического проживания: </xsl:text>
									<xsl:apply-templates select="pimar:KeeperPerson/FactAddress" mode="address"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								реквизиты документа, удостоверяющего личность, адрес регистрации и фактического проживания<sup>5</sup>)
							</td>
						</tr>
					</tbody>
				</table>
				<p style="text-indent: 5mm;">
					<xsl:text>Заявления, замечания лиц, присутствующих при производстве ареста имущества</xsl:text>
					<sup>6</sup>
					<xsl:text>:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 99%; width: 99%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:choose>
									<xsl:when test="not(pimar:StatementsComments)">Замечаний нет</xsl:when>
									<xsl:otherwise>
										<xsl:apply-templates select="pimar:StatementsComments"/>
									</xsl:otherwise>
								</xsl:choose>
								<br/>
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:text>.</xsl:text>
				<br/>
				<table>
					<tbody>
						<tr valign="top">
							<td width="20%">Приложения:</td>
							<td width="80%">
								<xsl:text>1. Копия решения таможенного органа о наложении ареста на товары от </xsl:text>
								<xsl:call-template name="month_date"><xsl:with-param name="date" select="pimar:ArrestDecision/cat_ru:PrDocumentDate"/></xsl:call-template>
								<xsl:text> на </xsl:text>
								<span style="display: inline-block; width: 15mm; border-bottom: 1px solid black;">
									<xsl:apply-templates select="pimar:ArrestDecision/pimar:SheetsNumber"/>
								</span>
								<xsl:text>листах.</xsl:text>
								<br/>
								<xsl:text>2. Материалы видеозаписи, прилагаемые к настоящему протоколу.</xsl:text>
								<br/>
								<xsl:text>3. Иные документы, замечания, объяснения, поступившие во время оставления протокола: </xsl:text>
								<xsl:apply-templates select="pimar:OtherDocStatementsComments"/>
								<xsl:text>.</xsl:text>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr valign="bottom">
							<td width="30%" style="border-bottom: 1px solid black;">
								Должностное лицо
								<br/>
								таможенного органа
								<br/>
								Российской Федерации
								<br/>
								<br/>
								<xsl:apply-templates select="pimar:CustomsPerson/cat_ru:PersonPost"/>
							</td>
							<td width="5%"/>
							<td width="20%" style="border-bottom: 1px solid black;"></td>
							<td width="5%"/>
							<td width="40%" align="center" style="border-bottom: 1px solid black;">
								<xsl:apply-templates select="pimar:CustomsPerson" mode="personFIO"/>
							</td>
						</tr>
						<tr class="descr">
							<td>(должность)</td>
							<td></td>
							<td>(подпись)</td>
							<td></td>
							<td>(фамилия, имя, отчество(при наличии)</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Лицо (представитель лица), на товары которого налагается арест:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="personFamilyIO"/>
								<xsl:if test="pimar:OwnerOrgPerson/cat_ru:PersonPost">
									<xsl:text>, </xsl:text>
									<xsl:apply-templates select="pimar:OwnerOrgPerson/cat_ru:PersonPost"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(наименование организации (фамилия, инициалы индивидуального предпринимателя), должность лица,
							</td>
						</tr>
						<tr align="left">
							<td class="value">
								<xsl:text>документ, удостоверящий личность: </xsl:text>
								<xsl:apply-templates select="pimar:OwnerOrgPerson/pimar:IdentityCard" mode="identity"/>
								<xsl:if test="pimar:OwnerOrgPerson/pimar:PowerOfAttorney">
									<br/>
									<xsl:text>документ, подтверждающий полномочия: </xsl:text>
									<xsl:apply-templates select="pimar:OwnerOrgPerson/pimar:PowerOfAttorney" mode="attorney"/>
								</xsl:if>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								реквизиты документа, удостоверяющего личность (реквизиты документа, подтверждающего полномочия лица (при наличии)
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="signatureFIO"/>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Представитель организации, осуществляющей хранение арестованных товаров:</xsl:text>
				</p>
				<table class="inlinetable" style="min-width: 100%; width: 100%;">
					<tbody>
						<tr align="left">
							<td class="value">
								<xsl:if test="pimar:KeeperOrgPerson/cat_ru:PersonPost">
									<xsl:apply-templates select="pimar:KeeperOrgPerson/cat_ru:PersonPost"/>
									<xsl:text>, </xsl:text>
								</xsl:if>
								<xsl:text>документ, удостоверящий личность: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperOrgPerson/pimar:IdentityCard" mode="identity"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(должность, реквизиты документа, удостоверяющего личность
							</td>
						</tr>
						<tr align="left">
							<td class="value">
								<xsl:text>документ, подтверждающий полномочия: </xsl:text>
								<xsl:apply-templates select="pimar:KeeperOrgPerson/pimar:PowerOfAttorney" mode="attorney"/>
								<br/>
							</td>
						</tr>
						<tr align="center">
							<td class="descr">
								(реквизиты документа, подтверждающего полномочия представителя лица
							</td>
						</tr>
					</tbody>
				</table>
				<xsl:apply-templates select="pimar:KeeperOrgPerson" mode="signatureFIO"/>
				<br/>
				<br/>
				<table>
					<tbody>
						<tr>
							<td class="bordered" align="center">
								<xsl:text>(данный раздел заполняется в случае, если арест имущества производится без применения видеозаписи)</xsl:text>
							</td>
						</tr>
						<tr>
							<td class="bordered">
								<xsl:text>Понятые</xsl:text><sup>7</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 1]" mode="signatureFIO"/>
								<br/>
								<xsl:text>Специалисты</xsl:text><sup>8</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 2]" mode="signatureFIO"/>
								<br/>
								<xsl:text>Иные лица, присутствующие при аресте имущества</xsl:text><sup>9</sup><xsl:text>:</xsl:text>
								<br/>
								<xsl:apply-templates select="pimar:Persons[pimar:PersonRole = 3]" mode="signatureFIO"/>
							</td>
						</tr>
					</tbody>
				</table>
				<br/>
				<p style="text-indent: 5mm;">
					<xsl:text>Копию настоящего протокола таможенного органа о наложении ареста на товары получил:</xsl:text>
					<table class="inlinetable" style="min-width: 50%; width: 50%;">
						<tbody>
							<tr align="center">
								<td class="value">
									<xsl:apply-templates select="pimar:OwnerOrgPerson/cat_ru:PersonPost"/>
									<br/>
								</td>
							</tr>
							<tr align="center">
								<td class="descr">
									(доложность лица (представителя лица), на имущество которого наложен арест имущества)
								</td>
							</tr>
						</tbody>
					</table>
				</p>
				<xsl:apply-templates select="pimar:OwnerOrgPerson" mode="signatureFIO"/>
				
				<br/>
				<br/>
				<div style="font-size: 8pt;">
					<sup>1</sup><xsl:text> При отсутствии сведений о плательщике таможенных платежей, специальных, антидемпинговых, компенсационных пошлин, процентов и пеней указывается: "сведения о плательщике отсутствуют".</xsl:text>
					<br/>
					<sup>2</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>3</sup><xsl:text> Указывается при возможности.</xsl:text>
					<br/>
					<sup>4</sup><xsl:text> Заполняется в случае указания стоимости товаров.</xsl:text>
					<br/>
					<sup>5</sup><xsl:text> Адрес фактического проживания указывается при наличии.</xsl:text>
					<br/>
					<sup>6</sup><xsl:text> При отсутствии замечаний вносится запись "Замечаний нет".</xsl:text>
					<br/>
					<sup>7</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>8</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
					<br/>
					<sup>9</sup><xsl:text> В случае отказа лица подписать протокол, в поле "подпись" вносится запись "Отказ лица".</xsl:text>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="*" mode="signatureFIO">
		<table>
			<tbody>
				<tr align="center" valign="bottom">
					<td width="45%" style="border-bottom: 1px solid black;">
						<xsl:apply-templates select="pimar:ConsentSign"/>
					</td>
					<td width="10%"></td>
					<td width="45%" style="border-bottom: 1px solid black;">
						<xsl:apply-templates select="." mode="personFIO"/>
					</td>
				</tr>
				<tr class="descr">
					<td width="45%">(подпись)</td>
					<td width="10%"></td>
					<td width="45%">(фамилия, имя, отчество (при наличии)</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="pimar:KeeperOrganization">
		<xsl:apply-templates select="pimar:OrganizationName"/>
		<xsl:text>, адрес: </xsl:text>
		<xsl:apply-templates select="pimar:Address" mode="address"/>
		<xsl:if test="pimar:StorageLocation">
			<xsl:text>, место хранения: </xsl:text>
			<xsl:apply-templates select="pimar:StorageLocation"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="pimar:KeeperPerson">
		<xsl:apply-templates select="." mode="personFIO"/>
		<xsl:if test="cat_ru:PersonPost">
			<xsl:text>, </xsl:text>
			<xsl:apply-templates select="cat_ru:PersonPost"/>
		</xsl:if>
		<xsl:if test="pimar:IdentityCard">
			<xsl:text>, документ: </xsl:text>
			<xsl:apply-templates select="pimar:IdentityCard" mode="identity"/>
		</xsl:if>
		<xsl:if test="pimar:PowerOfAttorney">
			<xsl:text>, доверенность: </xsl:text>
			<xsl:apply-templates select="pimar:PowerOfAttorney" mode="attorney"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="attorney">
		<xsl:if test="*[local-name() = 'PrDocumentNumber']">
			<xsl:text> № </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'PrDocumentNumber']"/>
		</xsl:if>
		<xsl:if test="*[local-name() =  'PrDocumentDate']">
			<xsl:text> от </xsl:text>
			<xsl:apply-templates select="*[local-name() =  'PrDocumentDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="pimar:ConsentSign">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 0 or translate(substring(., 1, 1), 'f', 'F') = 'F'">Отказ лица</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="org">
		<xsl:choose>
			<xsl:when test="not(*[local-name() = 'OrganizationName'])">
				<xsl:apply-templates select="*[local-name() = 'ShortName']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() = 'OrganizationName']"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="*[local-name() = 'Address']">
			<xsl:text>, адрес: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'Address']" mode="address"/>
		</xsl:if>
		<xsl:if test="*[local-name() = 'RFOrganizationFeatures']/*[local-name() = 'INN']">
			<xsl:text>, ИНН: </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'RFOrganizationFeatures']/*[local-name() = 'INN']"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="pimar:ArrestKind">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">полный</xsl:when>
				<xsl:when test=". = 2">частичный</xsl:when>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template match="*" mode="personRole">
		<table class="inlinetable" style="min-width: 100%; width: 100%;">
			<tbody>
				<tr align="left">
					<td class="value">
						<xsl:value-of select="position()"/>
						<xsl:text>. </xsl:text>
						<xsl:if test="cat_ru:PersonPost">
							<xsl:apply-templates select="cat_ru:PersonPost"/>
							<xsl:text>, </xsl:text>
						</xsl:if>
						<xsl:apply-templates select="." mode="personFIO"/>
						<xsl:if test="pimar:IdentityCard">
							<xsl:text>, документ: </xsl:text>
							<xsl:apply-templates select="pimar:IdentityCard" mode="identity"/>
						</xsl:if>
						<br/>
					</td>
				</tr>
				<tr align="center">
					<td class="descr">
						(должность (при наличии), фамилия, имя, отчество (при наличии), паспортные данные)
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	
	<xsl:template match="*" mode="identity">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'FullIdentityCardName']">
				<xsl:apply-templates select="*[local-name() = 'FullIdentityCardName']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() = 'IdentityCardName']"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardSeries']"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="*[local-name() = 'IdentityCardNumber']"/>
		<xsl:if test="*[local-name() = 'IdentityCardDate']">
			<xsl:text>, выдан </xsl:text>
			<xsl:apply-templates select="*[local-name() = 'IdentityCardDate']" mode="russian_date"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="personFIO">
		<xsl:apply-templates select="*[contains(local-name(), 'ame')]" mode="splitSpace"/>
	</xsl:template>
	
	<xsl:template match="*" mode="splitComma">
		<xsl:if test="position() != 1">, </xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	
	<xsl:template match="*" mode="personFamilyIO">
		<xsl:apply-templates select="*[local-name() = 'PersonSurname']"/>
		<xsl:text> </xsl:text>
		<xsl:value-of select="substring(*[local-name() = 'PersonName'], 1, 1)"/>
		<xsl:text>.</xsl:text>
		<xsl:if test="*[local-name() = 'PersonMiddleName']">
			<xsl:value-of select="substring(*[local-name() = 'PersonMiddleName'], 1, 1)"/>
			<xsl:text>.</xsl:text>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="*" mode="splitSpace">
		<xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="splitCR">
		<xsl:if test="position() != 1"><br/></xsl:if>
		<xsl:apply-templates select="."/>
	</xsl:template>
	<xsl:template match="*" mode="address">
		<xsl:choose>
			<xsl:when test="*[local-name() = 'AddressText']">
				<xsl:apply-templates select="*[local-name() = 'AddressText']"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*[local-name() != 'AddressText']" mode="splitComma"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="*[local-name() = 'AddressKindCode']">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:choose>
				<xsl:when test=". = 1">Адрес регистрации</xsl:when>
				<xsl:when test=". = 2">Фактический адрес</xsl:when>
				<xsl:when test=". = 3">Почтовый адрес</xsl:when>
				<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
			</xsl:choose>
		</element>
	</xsl:template>
	
	<xsl:template name="time">
		<xsl:param name="date"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 12, 2)"/>
			</span>
			<xsl:text> ч </xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 15, 2)"/>
			</span>
			<xsl:text> мин.</xsl:text>
		</element>
	</xsl:template>
	
	<xsl:template name="month_date">
		<xsl:param name="date"/>
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="$date"/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:variable name="month" select="substring($date, 6,2)"/>
			<xsl:text>"</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 9, 2)"/>
			</span>
			<xsl:text>" </xsl:text>
			<span style="display: inline-block; width: 25mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:choose>
					<xsl:when test="$month = '01'">января</xsl:when>
					<xsl:when test="$month = '02'">февраля</xsl:when>
					<xsl:when test="$month = '03'">марта</xsl:when>
					<xsl:when test="$month = '04'">апреля</xsl:when>
					<xsl:when test="$month = '05'">мая</xsl:when>
					<xsl:when test="$month = '06'">июня</xsl:when>
					<xsl:when test="$month = '07'">июля</xsl:when>
					<xsl:when test="$month = '08'">августа</xsl:when>
					<xsl:when test="$month = '09'">сентября</xsl:when>
					<xsl:when test="$month = '10'">октября</xsl:when>
					<xsl:when test="$month = '11'">ноября</xsl:when>
					<xsl:when test="$month = '12'">декабря</xsl:when>
				</xsl:choose>
			</span>
			<xsl:text> 20</xsl:text>
			<span style="display: inline-block; width: 10mm; text-align: center; border-bottom: 1px solid black;">
				<xsl:value-of select="substring($date, 3, 2)"/>
			</span>
			<xsl:text>г.</xsl:text>
		</element>
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
	<xsl:template match="//*[local-name()='ProtocolImpositionArrest']//*" priority="-1">
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
