<?xml version="1.0" encoding="utf-8"?>
<!--Приказ Минфина России № 125н от 14 августа 2019 года "Об утверждении типовых форм договоров поручительства, обеспечивающих исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, обязанностей уполномоченного экономического оператора"
GuaranteeContractKind = "1" - Приложение к Приложению №3 (Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и (или) исполнение обязанностей уполномоченного экономического оператора)
GuaranteeContractKind = "2" - Приложение к Приложению №4 (Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин)-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:clt_ru="urn:customs.ru:CommonLeafTypes:5.10.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:agc="urn:customs.ru:Information:CommercialFinanceDocuments:AdditionGuaranteeContract:5.25.0">
	<!-- Шаблон для типа AdditionGuaranteeContractType -->
	<xsl:template match="agc:AdditionGuaranteeContract">
		<xsl:param name="w" select="190" />
		<html>
			<head>
				<title>Дополнение к договору поручительства</title>
				<style>
					body
					{background: #cccccc;
					font-family: Arial;}

					div.page
					{width: 210mm;
					max-width: 210mm;
					margin: 10px auto;
					margin-top: 6pt;
					margin-bottom: 6pt;
					padding: 10mm 10mm 10mm 20mm;
					background: #ffffff;
					border: solid 1pt #000000;}

					.marg-top
					{margin-top:5mm;}

					table
					{width: 100%;
					max-width: 100%;
					border: 0;
					empty-cells: show;
					border-collapse: collapse;
					margin-top: 1px;}

					.inlinetable
					{border: 0;
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
					text-align: center;}

					table.border tr td
					{border: 1px solid gray;}

					.graph
					{font-family: Arial;
					font-size: 10pt;}

					.value
					{border-bottom: solid 1px black;
					vertical-align:bottom;
					font-style:italic;}

					div.title, tr.title td
					{font-weight:bold;}

					.bordered
					{border-collapse: collapse;}

					td.bordered
					{border: solid 1px windowtext;}

					td.graphMain
					{vertical-align:top;}

					td.value.graphMain
					{vertical-align:bottom;}

					.descr
					{font-size: 7pt;
					text-align: center;
					vertical-align:top;}

					.delim
					{height: 7pt;}

					.delim_3
					{height: 3pt;}

					.indent
					{text-indent: 1.5em;}
				</style>
			</head>
			<body>
				<xsl:choose>
					<xsl:when test="agc:GuaranteeContractKind='1'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b>
												<xsl:text>Дополнение</xsl:text>
												<br/>
												<xsl:text>к Договору поручительства, обеспечивающему в отношении</xsl:text>
												<br/>
												<xsl:text>нескольких лиц исполнение обязанностей юридического лица,</xsl:text>
												<br/>
												<xsl:text>осуществляющего деятельность в сфере таможенного дела,</xsl:text>
												<br/>
												<xsl:text>и (или) исполнение обязанностей уполномоченного экономического</xsl:text>
												<br/>
												<xsl:text>оператора, от</xsl:text>
												<xsl:call-template name="russian_date_month">
													<xsl:with-param name="dateIn" select="agc:RelatedContract/cat_ru:PrDocumentDate"/>
												</xsl:call-template>
												<xsl:text>, заключенному</xsl:text>
												<br/>
												<xsl:text>между </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
															<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
															<xsl:text> (</xsl:text>
														</xsl:if>
														<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
														<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
															<xsl:text>)</xsl:text>
														</xsl:if>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
													<xsl:with-param name="width" select="'70mm'"/>
												</xsl:call-template>
												&#160;<xsl:text>и </xsl:text>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(наименование поручителя)'"/>
													<xsl:with-param name="width" select="'70mm'"/>
												</xsl:call-template>
											</b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="agc:AdditionGuaranteeContractDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber or agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение дополнения к договору поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование поручителя)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber or agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Поручителя на заключение дополнения к договору поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>с другой стороны, вместе именуемые «Стороны», заключили настоящее Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанностей юридического лица, осуществляющего деятельность в сфере таможенного дела, и (или) исполнение обязанностей уполномоченного экономического оператора, от </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:RelatedContract/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<xsl:text>, заключенному между </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование поручителя)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>(далее - Договор поручительства), о нижеследующем:</xsl:text>
							</div>
							<!-- Пункты договора -->
							<div style="text-align: justify">
								<br/>
								<xsl:text>1. В соответствии с пунктами 1.1 и 1.2 Договора поручительства Поручитель обеспечивает перед Кредитором исполнение</xsl:text>
								<br/>
								<table class="inlinetable">
									<tbody>
										<tr align="center">
											<td class="value" width="99%">
												<xsl:value-of select="agc:ObligationDescription"/>
											</td>
											<td width="1%" valign="bottom">,</td>
										</tr>
										<tr align="center">
											<td class="descr" width="100%" colspan="2">
												<xsl:text>(указывается один из следующих возможных вариантов в зависимости от осуществляемой (планируемой к осуществлению) деятельности в сфере таможенного дела и (или) от включения в реестр уполномоченных экономических операторов:</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного перевозчика;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика</xsl:text><!--sup>12</sup--><xsl:text>;</xsl:text>
												<br/>
												<xsl:text>обязанностей уполномоченного экономического оператора;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя, и обязанностей уполномоченного экономического оператора</xsl:text><!--sup>13</sup--><xsl:text>;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного перевозчика, и обязанностей уполномоченного экономического оператора</xsl:text><!--sup>14</sup--><xsl:text>;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве таможенного представителя и таможенного перевозчика, и обязанностей уполномоченного экономического оператора</xsl:text><!--sup>15</sup--><xsl:text>;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца свободного склада;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца склада временного хранения;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца таможенного склада;</xsl:text>
												<br/>
												<xsl:text>обязанностей юридического лица, осуществляющего деятельность в качестве владельца магазина беспошлинной торговли)</xsl:text>
											</td>
										</tr>
									</tbody>
								</table>
								<br/>
								<xsl:text>в отношении </xsl:text>
								<br/>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agc:Debtor"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование юридического лица, осуществляющего деятельность (претендующего на осуществление деятельности) в сфере таможенного дела, и (или) включенного (претендующего на включение) в реестр уполномоченных экономических операторов, адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика, банковские реквизиты, адрес свободного склада, таможенного склада, склада временного хранения или магазина беспошлинной торговли (только для указанной деятельности))'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>в том числе таких обязанностей, которые могут возникнуть в будущем, в сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="translate(translate(format-number(agc:ObligationAmount div 100, '#,###.00'),',',' '),'.',',')"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="agc:ObligationAmountText"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>рублей.</xsl:text>
								<br/><br/>
								<xsl:text>2. Настоящее Дополнение составлено в двух экземплярах, имеющих одинаковую юридическую силу, по одному экземпляру для каждой из Сторон.</xsl:text>
								<br/><br/>
								<xsl:text>3. Настоящее Дополнение вступает в силу с </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:DateBegin"/>
								</xsl:call-template>
								<xsl:text> и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:DateEnd"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
							</div>
							<br/><br/>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td width="50%">
												<xsl:text>от Кредитора</xsl:text>
												<br/><br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												&#160;&#160;&#160;&#160;&#160;
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="agc:Creditor/agc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<br/>
												<span class="descr"><xsl:text>м.п. (при наличии)</xsl:text></span>
											</td>
											<td width="50%">
												<xsl:text>от Поручителя</xsl:text>
												<br/><br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												&#160;&#160;&#160;&#160;&#160;
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="agc:Guarantor/agc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<br/>
												<span class="descr"><xsl:text>м.п. (при наличии)</xsl:text></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</xsl:when>
					<xsl:when test="agc:GuaranteeContractKind='2'">
						<div class="page">
							<!-- Шапка -->
							<table>
								<tbody>
									<tr align="center" valign="top">
										<td>
											<b><xsl:text>Дополнение</xsl:text>
											<br/>
											<xsl:text>к Договору поручительства, обеспечивающему в отношении</xsl:text>
											<br/>
											<xsl:text>нескольких лиц исполнение обязанности по уплате таможенных</xsl:text>
											<br/>
											<xsl:text>пошлин, налогов, таможенных сборов, специальных,</xsl:text>
											<br/>
											<xsl:text>антидемпинговых, компенсационных пошлин,</xsl:text>
											<br/>
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date_month">
												<xsl:with-param name="dateIn" select="agc:RelatedContract/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
											<xsl:text>, заключенному между</xsl:text>
											<br/>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
														<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
														<xsl:text> (</xsl:text>
													</xsl:if>
													<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
													<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
														<xsl:text>)</xsl:text>
													</xsl:if>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template>
											&#160;<xsl:text>и </xsl:text>
											<xsl:call-template name="inlinetable">
												<xsl:with-param name="data">
													<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
												</xsl:with-param>
												<xsl:with-param name="data_align" select="'center'"/>
												<xsl:with-param name="description" select="'(наименование поручителя)'"/>
												<xsl:with-param name="width" select="'70mm'"/>
											</xsl:call-template></b>
										</td>
									</tr>
								</tbody>
							</table>
							<br/><br/>
							<table>
								<tr>
									<td align="left" style="width:130mm">
										<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>
									</td>
									<td align="right" style="width:50mm">
										<xsl:call-template name="russian_date_month">
											<xsl:with-param name="dateIn" select="agc:AdditionGuaranteeContractDate"/>
										</xsl:call-template>
									</td>
								</tr>
							</table>
							<br/><br/>
							<!-- Основная информация -->
							<div style="text-align: justify">
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>именуемая в дальнейшем «Кредитор», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="agc:Creditor/agc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber or agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="agc:Creditor/agc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия представителя Кредитора на заключение дополнения к договору поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>с одной стороны, и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(наименование)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>именуемое в дальнейшем «Поручитель», в лице </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonPost">
											<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonPost"/>
											<xsl:text>, </xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonSurname"/>
										<xsl:text> </xsl:text>
										<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonName"/>
										<xsl:if test="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonMiddleName">
											<xsl:text> </xsl:text>
											<xsl:value-of select="agc:Guarantor/agc:AuthorizedPerson/cat_ru:PersonMiddleName"/>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(должность, фамилия, имя, отчество (при наличии))'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>действующего на основании </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentName">
											<xsl:value-of select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentName"/>
											<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber or agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber">
											<xsl:text>№</xsl:text>
											<xsl:value-of select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentNumber"/>
											<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
												<xsl:text> </xsl:text>
											</xsl:if>
										</xsl:if>
										<xsl:if test="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate">
											<xsl:text>от </xsl:text>
											<xsl:call-template name="russian_date">
												<xsl:with-param name="dateIn" select="agc:Guarantor/agc:ConfirmingDocument/cat_ru:PrDocumentDate"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(указываются реквизиты документа, подтверждающего полномочия на заключение дополнения к договору поручительства)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>с другой стороны, вместе именуемые «Стороны», заключили настоящее Дополнение к Договору поручительства, обеспечивающему в отношении нескольких лиц исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, от </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:RelatedContract/cat_ru:PrDocumentDate"/>
								</xsl:call-template>
								<xsl:text>, заключенному между</xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName"/>
											<xsl:text> (</xsl:text>
										</xsl:if>
										<xsl:value-of select="agc:Creditor/agc:CustomsDetails/cat_ru:Code"/>
										<xsl:if test="agc:Creditor/agc:CustomsDetails/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование таможенного органа Российской Федерации)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>и </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="agc:Guarantor/cat_ru:OrganizationName"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(наименование поручителя)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>(далее - Договор поручительства), о нижеследующем:</xsl:text>
							</div>
							<!-- Пункты договора -->
							<div style="text-align: justify">
								<br/>
								<xsl:text>1. В соответствии с пунктами 1.1 и 1.2 Договора поручительства Поручитель обеспечивает перед Кредитором исполнение обязанности по уплате таможенных пошлин, налогов, таможенных сборов, специальных, антидемпинговых, компенсационных пошлин, в отношении </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agc:Debtor"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="comma" select="1"/>
									<xsl:with-param name="description" select="'(для организации: наименование, место нахождения и адрес, указанный в Едином государственном реестре юридических лиц, идентификационный номер налогоплательщика (далее - ИНН), банковские реквизиты; для физического лица: фамилия, имя, отчество (при наличии), наименование документа, удостоверяющего личность, серия и номер такого документа, место жительства, ИНН (при наличии); основной государственный регистрационный номер индивидуального предпринимателя (для лиц, осуществляющих деятельность в качестве индивидуального предпринимателя))'"/>
									<xsl:with-param name="width" select="'100%'"/>
								</xsl:call-template>
								<br/>
								<xsl:text>в том числе такой обязанности, которая может возникнуть в будущем, по </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:choose>
											<xsl:when test="agc:DocKind='1'">транзитной декларации</xsl:when>
											<xsl:when test="agc:DocKind='2'">декларации на товары</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="agc:DocKind"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(указывается один из следующих возможных вариантов: транзитной декларации; декларации на товары)'"/>
									<xsl:with-param name="width" select="'70mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>№ </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:apply-templates select="agc:RegNumberDT" mode="GTDID"/>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(регистрационный номер)'"/>
									<xsl:with-param name="width" select="'90mm'"/>
								</xsl:call-template>
								<!--sup>12</sup-->
								&#160;<xsl:text>в сумме не более </xsl:text>
								<xsl:call-template name="inlinetable">
									<xsl:with-param name="data">
										<xsl:value-of select="translate(translate(format-number(agc:ObligationAmount div 100, '#,###.00'),',',' '),'.',',')"/>
										<xsl:text> (</xsl:text>
										<xsl:value-of select="agc:ObligationAmountText"/>
										<xsl:text>)</xsl:text>
									</xsl:with-param>
									<xsl:with-param name="data_align" select="'center'"/>
									<xsl:with-param name="description" select="'(цифрами и прописью)'"/>
									<xsl:with-param name="width" select="'100mm'"/>
								</xsl:call-template>
								&#160;<xsl:text>рублей.</xsl:text>
								<br/><br/>
								<xsl:text>2. Настоящее Дополнение составлено в двух экземплярах, имеющих одинаковую юридическую силу, по одному экземпляру для каждой из Сторон.</xsl:text>
								<br/><br/>
								<xsl:text>3. Настоящее Дополнение вступает в силу с </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:DateBegin"/>
								</xsl:call-template>
								<xsl:text> и действует до </xsl:text>
								<xsl:call-template name="russian_date_month">
									<xsl:with-param name="dateIn" select="agc:DateEnd"/>
								</xsl:call-template>
								<xsl:text> включительно.</xsl:text>
							</div>
							<br/><br/>
							<!-- Адреса и реквизиты Сторон -->
							<div>
								<table style="page-break-inside: avoid;">
									<tbody>
										<tr>
											<td width="50%">
												<xsl:text>от Кредитора</xsl:text>
												<br/><br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												&#160;&#160;&#160;&#160;&#160;
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="agc:Creditor/agc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<br/>
												<span class="descr"><xsl:text>м.п. (при наличии)</xsl:text></span>
											</td>
											<td width="50%">
												<xsl:text>от Поручителя</xsl:text>
												<br/><br/>
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:text>   </xsl:text>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(подпись)'"/>
													<xsl:with-param name="width" select="'30mm'"/>
												</xsl:call-template>
												&#160;&#160;&#160;&#160;&#160;
												<xsl:call-template name="inlinetable">
													<xsl:with-param name="data">
														<xsl:apply-templates select="agc:Guarantor/agc:AuthorizedPerson" mode="fio"/>
													</xsl:with-param>
													<xsl:with-param name="data_align" select="'center'"/>
													<xsl:with-param name="description" select="'(фамилия, инициалы)'"/>
													<xsl:with-param name="width" select="'50mm'"/>
												</xsl:call-template>
												<br/>
												<br/>
												<br/>
												<span class="descr"><xsl:text>м.п. (при наличии)</xsl:text></span>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</xsl:when>
				</xsl:choose>
			</body>
		</html>
	</xsl:template>

	<!--Шаблон для типа agc:Debtor-->
	<xsl:template match="agc:Debtor">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName and not(cat_ru:OrganizationName)">
			<xsl:value-of select="cat_ru:ShortName"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:INN">
			<xsl:text>, ИНН - </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:RFOrganizationFeatures/cat_ru:OGRN">
			<xsl:text>, ОГРН/ОГРНИП - </xsl:text>
			<xsl:value-of select="cat_ru:RFOrganizationFeatures/cat_ru:OGRN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:text>, </xsl:text>
			<xsl:choose>
				<xsl:when test="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName">
					<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardName"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:FullIdentityCardName"/>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:text> серия </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardSeries"/>
			<xsl:text> номер </xsl:text>
			<xsl:value-of select="RUScat_ru:IdentityCard/RUScat_ru:IdentityCardNumber"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:SubjectAddressDetails">
			<xsl:for-each select="RUScat_ru:SubjectAddressDetails">
				<xsl:if test="position()=1">
					<xsl:text>, </xsl:text>
				</xsl:if>
				<xsl:choose>
					<xsl:when test="RUScat_ru:AddressKindCode='1'">адрес регистрации</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='2'">фактический адрес</xsl:when>
					<xsl:when test="RUScat_ru:AddressKindCode='3'">почтовый адрес</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="RUScat_ru:AddressKindCode"/>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:text> - </xsl:text>
				<xsl:for-each select="RUScat_ru:PostalCode | RUScat_ru:CounryName | RUScat_ru:Region | RUScat_ru:District | RUScat_ru:Town | RUScat_ru:City | RUScat_ru:StreetHouse | RUScat_ru:House | RUScat_ru:Room | RUScat_ru:AddressText">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">, </xsl:if>
				</xsl:for-each>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
		<xsl:if test="RUScat_ru:BankInformation">
			<xsl:text>; банковские реквизиты - </xsl:text>
			<xsl:for-each select="RUScat_ru:BankInformation">
				<xsl:text>тип счета: </xsl:text>
				<xsl:for-each select="cat_ru:BankAccountDescription">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>; счет(а): </xsl:text>
				<xsl:for-each select="cat_ru:BankAccount">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				<xsl:if test="cat_ru:BankName">
					<xsl:text>; банк: </xsl:text>
					<xsl:value-of select="cat_ru:BankName"/>
				</xsl:if>
				<xsl:if test="cat_ru:BankMFO">
					<xsl:text>; МФО банка: </xsl:text>
					<xsl:value-of select="cat_ru:BankMFO"/>
				</xsl:if>
				<xsl:if test="cat_ru:OKPOID">
					<xsl:text>; ОКПО банка: </xsl:text>
					<xsl:value-of select="cat_ru:OKPOID"/>
				</xsl:if>
				<xsl:if test="cat_ru:BICID">
					<xsl:text>; БИК: </xsl:text>
					<xsl:value-of select="cat_ru:BICID"/>
				</xsl:if>
				<xsl:if test="cat_ru:SWIFTID">
					<xsl:text>; SWIFT банка: </xsl:text>
					<xsl:value-of select="cat_ru:SWIFTID"/>
				</xsl:if>
				<xsl:if test="cat_ru:CorrAccount">
					<xsl:text>; к/с банка: </xsl:text>
					<xsl:value-of select="cat_ru:CorrAccount"/>
				</xsl:if>
				<xsl:if test="cat_ru:CorrAccount">
					<xsl:text>; к/с банка: </xsl:text>
					<xsl:value-of select="cat_ru:CorrAccount"/>
				</xsl:if>
				<xsl:if test="cat_ru:TransitCurrencyAccount">
					<xsl:text>; валютный счет организации (транзитный): </xsl:text>
					<xsl:for-each select="cat_ru:TransitCurrencyAccount">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="cat_ru:SpecialTransitCurrencyAccount">
					<xsl:text>; валютный счет организации (специальный транзитный): </xsl:text>
					<xsl:for-each select="cat_ru:SpecialTransitCurrencyAccount">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:if>
				<xsl:if test="position()!=last()">
					<xsl:text>; </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="*" mode="GTDID">
		<xsl:apply-templates select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:RegistrationDate" mode="gtd_date"/>
		<xsl:text>/</xsl:text>
		<xsl:apply-templates select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template match="*" mode="fio">
		<xsl:apply-templates select="cat_ru:PersonSurname"/>
		<xsl:text> </xsl:text>
		<xsl:apply-templates select="cat_ru:PersonName" mode="initial"/>
		<xsl:apply-templates select="cat_ru:PersonMiddleName" mode="initial"/>
	</xsl:template>
	<xsl:template match="*" mode="initial">
		<xsl:variable name="xpath_date">
			<xsl:call-template name="get_xpath">
				<xsl:with-param name="node" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<element xml_node="{$xpath_date}">
			<xsl:value-of select="concat(substring(., 1, 1), '.')"/>
		</element>
	</xsl:template>
	<xsl:template match="//*[local-name()='AdditionGuaranteeContract']//*" priority="-1">
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
	<xsl:template name="russian_date">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:value-of select="substring($dateIn,9,2)"/>.<xsl:value-of select="substring($dateIn,6,2)"/>.<xsl:value-of select="substring($dateIn,1,4)"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="russian_date_month">
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<xsl:text>«</xsl:text>
				<span class="value">&#160;<xsl:value-of select="substring($dateIn,9,2)"/>&#160;</span>
				<xsl:text>» </xsl:text>
				<span class="value">&#160;<xsl:call-template name="month">
						<xsl:with-param name="number" select="substring($dateIn,6,2)"/>
					</xsl:call-template>&#160;</span>
					<xsl:text> 20</xsl:text>
				<span class="value">
					<xsl:value-of select="substring($dateIn,3,2)"/>
				</span>
				<xsl:text> г.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="month">
		<xsl:param name="number"/>
		<xsl:if test="$number='01'">января</xsl:if>
		<xsl:if test="$number='02'">февраля</xsl:if>
		<xsl:if test="$number='03'">марта</xsl:if>
		<xsl:if test="$number='04'">апреля</xsl:if>
		<xsl:if test="$number='05'">мая</xsl:if>
		<xsl:if test="$number='06'">июня</xsl:if>
		<xsl:if test="$number='07'">июля</xsl:if>
		<xsl:if test="$number='08'">августа</xsl:if>
		<xsl:if test="$number='09'">сентября</xsl:if>
		<xsl:if test="$number='10'">октября</xsl:if>
		<xsl:if test="$number='11'">ноября</xsl:if>
		<xsl:if test="$number='12'">декабря</xsl:if>
	</xsl:template>
	<xsl:template name="inlinetable">
		<xsl:param name="data"/>
		<xsl:param name="description"/>
		<xsl:param name="width"/>
		<xsl:param name="data_align"/>
		<xsl:param name="list" select="0"/>
		<xsl:param name="comma" select="0"/>
		<xsl:param name="dot" select="0"/>
		<xsl:variable name="width_td1">
			<xsl:choose>
				<xsl:when test="$comma=0 and $list=0 and $dot=0">
					<xsl:value-of select="'100%'"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'99%'"/>
				</xsl:otherwise>
			</xsl:choose>.
		</xsl:variable>
		<table class="inlinetable" style="width: {$width};">
			<tbody>
				<tr align="{$data_align}">
					<td class="value" width="{$width_td1}">
						<xsl:value-of select="$data"/>
						<br/>
					</td>
					<xsl:if test="$comma != 0">
						<td width="1%" valign="bottom">,</td>
					</xsl:if>
					<xsl:if test="$list != 0">
						<td width="1%" valign="bottom">;</td>
					</xsl:if>
					<xsl:if test="$dot != 0">
						<td width="1%" valign="bottom">.</td>
					</xsl:if>
				</tr>
				<tr align="center">
					<td class="descr" width="{$width_td1}">
						<xsl:value-of select="$description"/>
					</td>
					<xsl:if test="$comma != 0 or $list != 0 or $dot != 0">
						<td class="descr" width="1%">
							<br/>
						</td>
					</xsl:if>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>