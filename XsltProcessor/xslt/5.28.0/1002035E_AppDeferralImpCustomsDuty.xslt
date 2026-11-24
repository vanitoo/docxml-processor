<?xml version="1.0" encoding="utf-8"?>
<!-- Приказ Приказ ФТС России от 28.02.2019 № 342, Приложение 1-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:catESAD_cu="urn:customs.ru:CUESADCommonAggregateTypesCust:5.28.0" xmlns:cat_ru="urn:customs.ru:CommonAggregateTypes:5.24.0" xmlns:adicd="urn:customs.ru:Information:CommercialFinanceDocuments:AppDeferralImpCustomsDuty:5.28.0" xmlns:RUScat_ru="urn:customs.ru:RUSCommonAggregateTypes:5.24.0" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xsl:template match="adicd:AppDeferralImpCustomsDuty">
		<html>
			<head>
				<style>
					body {
					background: #cccccc;
					font-family: Arial;
					}

					div.page {
					width: 180mm;
					max-width: 180mm;
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

			.graph {
			font-family: Arial;
			font-size: 10pt;
			}

			.value
			{
			border-bottom: solid 1px black;
			}

			div.title, tr.title td { font-weight:bold;  }
			.bordered { border-collapse: collapse; }
			td.bordered
			{
				border: solid 1px windowtext;
			}

			.border_bottom
			{
			border-bottom: 1px solid black;
			}

			.graphMain
			{
			font-family: Arial;
			font-size: 11pt;
			}

			.graphLittle 
			{
			font-family: Arial;
			font-size: 7pt;
			}
	
			.graphDelim 
			{
			font-family: Arial;
			font-size: 4pt;
			}

			td.graphMain
			{
			vertical-align:top;
			}
			td.value.graphMain
			{
			vertical-align:top;
			}

			.graphHeader
			{
			font-family: Arial;
			font-size: 11pt;
			font-weight:bold;
			}

			td.graphHeader
			{
			vertical-align:top;
			}
			td.value.graphHeader
			{
			vertical-align:bottom;
			}

			.normal
			{
			font-size: 11pt;
			font-family:Arial;
			}			

			.bold
			{
			font-weight: bold;
			font-family:Arial;
			font-size: 9pt;
			}			

			.italic
			{
			font-style: italic;
			font-family:Arial;
			font-size: 11pt;
			}		
			
			.delim {
				height: 7pt;
			}

			.delim_3 {
				height: 3pt;
				font-family:Arial;
				font-size: 3pt;
			}

				</style>
			</head>
			<body>
				<div class="page">
					<table class="graphMain" width="100%">
						<tbody>
							<tr>
								<td width="30%"/>
								<td  width="70%" class="value" align="center">
									<span>
										<xsl:value-of select="adicd:Customs/cat_ru:OfficeName"/>
										<xsl:if test="adicd:Customs/cat_ru:OfficeName">
											<xsl:text>&#160;(</xsl:text>
										</xsl:if>
										<xsl:value-of select="adicd:Customs/cat_ru:Code"/>
										<xsl:if test="adicd:Customs/cat_ru:OfficeName">
											<xsl:text>)</xsl:text>
										</xsl:if>
									</span>
								</td>
							</tr>
							<tr>
								<td/>
								<td align="center" class="graphLittle">(наименование таможенного органа)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<table class="graphMain">
						<tbody>
							<tr align="center">
								<td>
									<b>ЗАЯВЛЕНИЕ<br>о предоставлении отсрочки или рассрочки уплаты</br>
										<br>ввозных тамоенных пошлин и (или налогов)</br>
									</b>
								</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br/>
					<table class="graphMain">
						<tbody>
							<tr>
								<td align="center" width="35%">
									<xsl:call-template name="DateStr">
										<xsl:with-param select="adicd:DateApplication" name="date"/>
									</xsl:call-template>
								</td>
								<td width="15%"/>
								<td width="5%"/>
								<td class="normal" align="left" width="3%">№&#160;		
								</td>
								<td class="value" align="center" width="42%">
										<xsl:value-of select="adicd:NumberApplication"/>
								</td>
							</tr>
							<tr>
								<td align="center" class="graphLittle">(дата направления заявления)</td>
								<td colspan="3"/>
								<td align="center" class="graphLittle">(исходящий номер)</td>
							</tr>
						</tbody>
					</table>
					<br/>
					<br>
						<table class="graphMain">
							<tbody>
								<tr style="text-align: justify;">
									<td>1. Наименование и организационно-правовая форма юридического лица/фамилия, имя, отчество (при наличии) индивидуального предпринимателя или физического лица:</td>
								</tr>
								<tr>
									<td class="delim_3"> <br/></td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="adicd:Applicant">
											<xsl:if test="cat_ru:OrganizationName">
												<xsl:value-of select="cat_ru:OrganizationName"/>
											</xsl:if>
											<xsl:if test="cat_ru:ShortName">
												<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
													<span class="normal"> (</span>
												</xsl:if>
												<xsl:value-of select="cat_ru:ShortName"/>
												<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
													<span class="normal">)</span>
												</xsl:if>
											</xsl:if>
											<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
												<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
											</xsl:if>
											<xsl:if test="RUScat_ru:BusinessEntityTypeName">
												<span class="normal">, </span>
												<span class="italic">ОПФ</span>
												<span class="normal">: </span>
												<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
											</xsl:if>
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="delim_3"> <br/></td>
								</tr>
								<tr style="text-align: justify;">
									<td>2. Местонахождение юридического лица и его почтовый адрес (для юридического лица)/почтовый адрес (для индивидуального предпринимателя или физического лица):</td>
								</tr>
								<xsl:for-each select="adicd:Applicant/RUScat_ru:SubjectAddressDetails">
									<tr>
										<td class="delim_3"> <br/></td>
									</tr>
									<tr>
										<td class="value">
											<xsl:call-template name="RUScat_ru:SubjectAddressDetails"/>
											<xsl:if test="position()!=last()">;</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="delim_3"> <br/></td>
								</tr>
								<tr style="text-align: justify;">
									<td>3. ИНН, код причины постановки на учет (КПП) (для юридического лица)/ИНН (для индивидуального предпринимателя или физического лица):</td>
								</tr>
								<tr>
									<td class="delim_3"> <br/></td>
								</tr>
								<tr>
									<td class="value">
										<xsl:choose>
											<xsl:when test="adicd:Applicant/cat_ru:RFOrganizationFeatures">
												<xsl:for-each select="adicd:Applicant/cat_ru:RFOrganizationFeatures">
													<xsl:value-of select="cat_ru:INN"/>
													<span class="italic"> / </span>
													<xsl:value-of select="cat_ru:KPP"/>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise>
												<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
												<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
												<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
												<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
											</xsl:otherwise>
										</xsl:choose>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align:justify;">
										<b>просит предоставить&#160;<span class="value">
												<xsl:if test="adicd:DeferralOrDeferredSign='2' or adicd:DeferralOrDeferredSign='4' or adicd:DeferralOrDeferredSign='6' or adicd:DeferralOrDeferredSign='8'"> отсрочку </xsl:if>
												<xsl:if test="adicd:DeferralOrDeferredSign='3' or adicd:DeferralOrDeferredSign='5' or adicd:DeferralOrDeferredSign='7' or adicd:DeferralOrDeferredSign='9'"> рассрочку </xsl:if>
											</span>&#160;уплаты ввозных таможенных пошлин и (или) налогов</b>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="graphMain">
											<tbody>
												<tr>
													<td valign="top" width="40%">по виду таможенного платежа:</td>
													<td class="bordered" width="3%" align="center">
														<xsl:if test="adicd:ImportCustomsDuty"><b>X</b></xsl:if>
													</td>
													<td width="57%">&#160;&#160;ввозная таможенная пошлина;</td>
												</tr>
												<tr class="delim_3">
													<td colspan="3"/>
												</tr>
												<tr>
													<td width="40%"/>
													<td class="bordered" width="3%" align="center">
														<xsl:if test="adicd:Excise"><b>X</b></xsl:if>
													</td>
													<td width="62%">&#160;&#160;акциз;</td>
												</tr>
												<tr class="delim_3">
													<td colspan="3"/>
												</tr>
												<tr>
													<td width="40%"/>
													<td class="bordered" width="3%" align="center">
														<xsl:if test="adicd:ValueAddedTax"><b>X</b></xsl:if>
													</td>
													<td width="62%">&#160;&#160;налог на добавленную стоимость</td>
												</tr>
												<tr class="delim_3">
													<td colspan="3">
														<br/>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr style="text-align: justify;">
									<td>4. На сумму: <span class="value">&#160;&#160;<xsl:value-of select="translate(translate(format-number(adicd:TotalAmount, '#,###.00'),',',' '),'.',',')"/>&#160;&#160;</span> рублей</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr style="text-align: justify;">
									<td>5. На срок: <span class="value">&#160;&#160;<xsl:value-of select="adicd:NumberMonths"/>&#160;&#160;</span>  месяцев
									</td>
								</tr>
								<tr style="text-align: justify;">
									<td>со дня, следующего за днем выпуска в соответствии с таможенной процедурой выпуска для внутреннего потребления товаров, на основании следующих документов, подтверждающих совершение внешнеэкономической сделки с товарами:</td>
								</tr>
								<tr class="delim_3">
									<td>
										<br/>
									</td>
								</tr>
								<xsl:choose>
									<xsl:when test="adicd:AttachedDocuments[adicd:EDocCode='03011' or adicd:EDocCode='03012'  or adicd:EDocCode= '03013'  or adicd:EDocCode='03014'  or adicd:EDocCode='03021'  or adicd:EDocCode='03022'  or adicd:EDocCode='03031' or adicd:EDocCode='04021']">
										<xsl:for-each select="adicd:AttachedDocuments">
											<xsl:if test="adicd:EDocCode='03011' or adicd:EDocCode='03012'  or adicd:EDocCode= '03013'  or adicd:EDocCode='03014'  or adicd:EDocCode='03021'  or adicd:EDocCode='03022'  or adicd:EDocCode='03031' or adicd:EDocCode='04021' "> <!--  or adicd:EDocCode='03098'  or adicd:EDocCode='03099'-->
												<tr>
													<td class="value">
														<xsl:call-template name="document">
															<xsl:with-param name="DocType"/>
														</xsl:call-template>
														<xsl:if test="adicd:DocArchIdDetails"> (<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">ID документа: <xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID"/>
															</xsl:if>
															<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">
																<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">;&#160;</xsl:if>ID хранилища: <xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID"/>
															</xsl:if>
															<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:DocumentModeID">
																<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID or adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">;&#160;</xsl:if>код вида документа: <xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:DocumentModeID"/>
															</xsl:if>)</xsl:if>
													</td>
												</tr>
											</xsl:if>
										</xsl:for-each>
									</xsl:when>
									<xsl:otherwise>
										<tr>
											<td class="value"><br/> </td>
										</tr>
									</xsl:otherwise>
								</xsl:choose>
								<tr class="delim_3">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;" class="normal">
										<xsl:if test="adicd:DeferralOrDeferredSign != '1'">и классифицируемых кодом (кодами) единой Товарной наменклатуры внешнеэкономической деятельности Евразийского экономического союза<sup>1</sup></xsl:if>
									</td>
								</tr>
								<tr class="delim_3">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td class="value">
										<xsl:for-each select="adicd:GoodsInfo[not(./adicd:GoodsTNVEDCode = preceding-sibling::adicd:GoodsInfo/adicd:GoodsTNVEDCode)]"> 
											<xsl:value-of select="adicd:GoodsTNVEDCode"/>
											<xsl:if test="position()!=last()">; </xsl:if> 
										</xsl:for-each>
										<br/>
									</td>
								</tr>
								<tr class="delim_3">
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center">
										<b>при наличии следующего основания (следующих оснований)<sup>2</sup>:</b>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="graphMain" style="text-align: justify;">
											<tbody>
												<tr>
													<td width="3%" valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='1' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td width="1%"/>
													<td width="96%" style="text-align: justify;">причинение организации ущерба в результате стихийного бедствия, технологической катастрофы или иных обстоятельств непреодолимой силы;</td>
												</tr>
												<tr>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='2' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td/>
													<td style="text-align: justify;">задержка организации финансирования из федерального (республиканского, государственного) бюджета или оплаты выполненного организацией государственного заказа;</td>
												</tr>
												<tr>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='3' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td/>
													<td style="text-align: justify;">осуществление поставок в рамках международных договоров, одной из сторон которых является Российская Федерация;</td>
												</tr>
												<tr>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='4' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td/>
													<td style="text-align: justify;">ввоз на таможенную территорию Евразийского экономического союза посадочного или посевного материала, средств защиты растений, сельскохозяйственной техники, объектов племенного живтоноводства (племенных сельскохозяйственных живтоных, птицы, рыбы, и других объектов племенного животноводства, племенной продукции (материала), продуктов, используемых для кормления живтоных, при условии, что организация осуществляет сельскохозяйственную деятельность, либо поставка таких товаров для организаций, осуществляющих сельскохозяйственную деятельность;</td>
												</tr>
												<tr>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='5' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td/>
													<td style="text-align: justify;">ввоз товаров, включенных в перечень отдельных типов ввозимых иностранных воздушных судов и комплектующих к ним, в отношении которых может быть предоставлена отсрочка или рассрочка уплаты налогов;</td>
												</tr>
												<tr>
													<td valign="top">
														<table>
															<tbody>
																<tr>
																	<td  class="bordered" align="center"><xsl:if test="adicd:BasisGrantingDeferralKind='6' and adicd:DeferralOrDeferredSign!='1'"><b>X</b></xsl:if><br/></td>
																</tr>
															</tbody>
														</table>
													</td>
													<td/>
													<td style="text-align: justify;">ввоз товаров для использования в промышленной переработке, в том числе сырья, материалов, технологического оборудования, комплектующих и запасных частей к нему</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr align="center">
									<td>
										<b>и заявляет следующие сведения:</b>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">
										6<sup>3</sup>. Исполнение обязанности по уплате ввозных таможенных пошлин, налогов обеспечено на сумму:&#160;
										<span class="value">&#160;&#160;<xsl:value-of select="translate(translate(format-number(adicd:Guarantee/adicd:GuaranteeAmount, '#,###.00'),',',' '),'.',',')"/>&#160;&#160;</span>  рублей, что подтверждается таможенной распиской (таможенными расписками)</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<tr>
									<td>
										<table class="graphMain">
											<tbody>
												<xsl:for-each select="adicd:Guarantee/adicd:CustomsReceipt">
													<tr>
														<td width="3%">№&#160;</td>
														<td class="value" align="center" width="45%">
															<xsl:apply-templates select="adicd:CustomsReceiptID"/>
														</td>
														<td width="15%">&#160;на сумму&#160;</td>
														<td class="value" align="center" width="30%">
															<xsl:value-of select="translate(translate(format-number(adicd:CRAmount, '#,###.00'),',',' '),'.',',')"/>
														</td>
														<td width="7%">&#160;рублей 
															<xsl:if test="position()!=last()">,</xsl:if>
														</td>
													</tr>
													<tr>
														<td class="delim_3" colspan="5"/>
													</tr>
												</xsl:for-each>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td style="text-align: justify;">7. Декларирование товаров на основании документов, указанных в разделе 5 настоящего заявления, с предоставлением <xsl:if test="adicd:DeferralOrDeferredSign='1'">отсрочки уплаты ввозных таможенных пошлин</xsl:if>
										<xsl:if test="adicd:DeferralOrDeferredSign='2' or adicd:DeferralOrDeferredSign='3' or adicd:DeferralOrDeferredSign='4' or adicd:DeferralOrDeferredSign= '5' or adicd:DeferralOrDeferredSign='6' or adicd:DeferralOrDeferredSign='7' or adicd:DeferralOrDeferredSign='8' or adicd:DeferralOrDeferredSign='9'">отсрочки (рассрочки) уплаты ввозных таможенных пошлин и (или) налогов будет осуществляться в следующем (следующих) таможенном органе (таможенных органах)</xsl:if> будет осуществляться в следующем (следующих) таможенном органе (таможенных органах):</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<xsl:for-each select="adicd:DeclCustoms">
									<tr>
										<td class="value">
											<xsl:value-of select="position()"/>)&#160;&#160;<xsl:value-of select="cat_ru:OfficeName"/>
											<xsl:if test="cat_ru:OfficeName">
												<xsl:text>&#160;(</xsl:text>
											</xsl:if>
											<xsl:value-of select="cat_ru:Code"/>
											<xsl:if test="cat_ru:OfficeName">
												<xsl:text>)</xsl:text>
											</xsl:if>
										</td>
									</tr>
									<tr>
										<td class="delim_3"/>
									</tr>
								</xsl:for-each>
								<tr>
									<td class="delim_3">
										<br/>
									</td>
								</tr>
								<tr>
									<td>8. Перечень прилагаемых документов:</td>
								</tr>
								<tr>
									<td class="delim_3"/>
								</tr>
								<xsl:for-each select="adicd:AttachedDocuments">
									<tr>
										<td class="value">
											<xsl:value-of select="position()"/>)&#160;&#160;<xsl:call-template name="document"/>
											<xsl:if test="adicd:DocArchIdDetails"> (<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">ID документа: <xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID"/>
												</xsl:if>
												<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">
													<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID">;&#160;</xsl:if>ID хранилища:<xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID"/>
												</xsl:if>
												<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:DocumentModeID">
													<xsl:if test="adicd:DocArchIdDetails/catESAD_cu:ElectronicDocumentID or adicd:DocArchIdDetails/catESAD_cu:ElectronicArchID">;&#160;</xsl:if>код вида документа: <xsl:value-of select="adicd:DocArchIdDetails/catESAD_cu:DocumentModeID"/>
												</xsl:if>)</xsl:if>
										</td>
									</tr>
								</xsl:for-each>
								<xsl:if test="adicd:DeferralOrDeferredSign!='1'">
									<tr>
										<td>
											<br/>
										</td>
									</tr>
									<tr>
										<td>
											<table class="graphMain">
												<tbody>
													<tr>
														<td width="3%" valign="top">
															<table>
																<tbody>
																	<tr>
																		<td  class="bordered" align="center"><xsl:if test="adicd:TimetableSign='true' or adicd:TimetableSign='t' or adicd:TimetableSign='1'"><b>X</b></xsl:if><br/></td>
																	</tr>
																</tbody>
															</table>
														</td>
														<td width="1%"/>
														<td width="96%" style="text-align: justify;">График поэтапной уплаты сумм ввозных таможенных пошлин и (или) налогов при рассрочке уплаты сумм ввозных таможенных пошлин и (или) налогов прилагается<sup>4</sup>.	
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</xsl:if>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>
										<table class="graphMain">
											<tbody>
												<tr>
													<td class="value" width="35%"/>
													<td width="15%"/>
													<td class="value" align="center" width="50%">
														<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonMiddleName"/>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" width="35%">(подпись руководителя юридического лица либо уполномоченного им лица, индивидуального предпринимателя или физического лица)</td>
													<td width="15%"/>
													<td class="graphLittle" align="center" width="50%">(фамилия, имя, отчество  (при наличии) руководителя юридического лица либо уполномоченного им лица, индивидуального предпринимателя или физического лица)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td>М.П.<sup>5</sup>
									</td>
								</tr>
								<tr>
									<td>
										<br/>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>1</sup>&#160;&#160;
										<xsl:text>Раздел заполняется при подаче заявления в соответствии с основаниями, установленными подпунктом 4 пункта 2 статьи 59 </xsl:text>
										<xsl:text>Таможенного кодекса Евразийского экономического союза и (или) пунктом 4 части 1 статьи 50 Федерального закона от 3 августа 2018 г. </xsl:text>
										<xsl:text>№ 289-ФЗ "О таможенном регулировании в Российской Федерации и о внесении изменений в отдельные законодательные акты Российской Федерации"</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>2</sup>&#160;&#160;
										<xsl:text>Раздел не заполняется в случае подачи заявления о предоставлении отсрочки уплаты ввозных таможенных пошлин в 	</xsl:text>
										<xsl:text>соответствии с пунктом 1 статьи 59 Таможенного кодекса Евразийского экономического союза.</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>3</sup>&#160;&#160;
										<xsl:text>Раздел не заполняется в случае подачи заявления юридическим лицом, являющимся уполномоченным экономическим оператором, </xsl:text>
										<xsl:text>имеющим свидетельство второго или третьего типа.</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>4</sup>&#160;&#160;
										<xsl:text>Поле заполняется в случае подачи заявления о предоставлении рассрочки уплаты ввозных таможенных пошлин и (или) налогов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>5</sup>&#160;&#160;
										<xsl:text>Если в соответствии с законодательством Российской Федерации лицо, подавшее заявление, имеет печать.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</br>
				</div>
				<xsl:if test="adicd:TimetableSign='true' or adicd:TimetableSign='t' or adicd:TimetableSign='1'">
					<div class="page">
						<table class="graphMain">
							<tbody>
								<tr>
									<td colspan="3" align="center">
										<b>
											<br/>График поэтапной уплаты сумм ввозных таможенных пошлин и (или) налогов при рассрочке уплаты сумм ввозных таможенных пошлин и (или) налогов
										</b>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<br/>
									</td>
								</tr>
								<tr>
									<td align="center" class="bordered" width="6%">№ п/п</td>
									<td align="center" class="bordered" width="40%">Количество календарных дней, начиная со дня, следующего за днем выпуска товаров в соответствии с таможенной процедурой выпуска для внутреннего потребеления, не позднее которых будет осуществлена уплата очередной части платежа<sup>1</sup></td>
									<td width="54%" class="bordered" align="center">Доля подлежащих уплате сумм ввозных таможенных пошлин и (или) налогов в процентах от общей суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты при выпуске товаров, %<sup>2</sup></td>
								</tr>
								<xsl:for-each select="adicd:TimetablePayment/adicd:TimetablePayMoment">
									<tr>
										<td class="bordered" align="center">
											<xsl:value-of select="adicd:RecNumber"/>
										</td>
										<td class="bordered" align="center">
											<xsl:value-of select="adicd:NumberDays"/>
										</td>
										<td class="bordered" align="center">
											<xsl:value-of select="adicd:Percent"/>
										</td>
									</tr>
								</xsl:for-each>
								<tr>
									<td align="center" class="bordered">ИТОГО:</td>
									<td align="center" class="bordered">
										<xsl:value-of select="adicd:TimetablePayment/adicd:TotalNumberDays"/>
									</td>
									<td align="center" class="bordered">
										<xsl:value-of select="adicd:TimetablePayment/adicd:TotalPercent"/>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<br/>
										<br/>
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<table class="graphMain">
											<tbody>
												<tr>
													<td class="value" width="35%"/>
													<td width="15%"/>
													<td class="value" align="center" width="50%">
														<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonSurname"/>&#160;<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonName"/>&#160;<xsl:value-of select="adicd:ApproverPerson/cat_ru:PersonMiddleName"/>
													</td>
												</tr>
												<tr>
													<td class="graphLittle" align="center" width="35%">(подпись руководителя организации либо лица, уполномоченного им на подпись)</td>
													<td width="15%"/>
													<td class="graphLittle" align="center" width="50%">(фамилия, имя, отчетство (при наличии) руководителя организации либо лица, уполномоченного им на подпись)</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<br/>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>1</sup>&#160;&#160;
										<xsl:text>Указывается количество календарных дней, не позднее которых будет осуществлена уплата очередной части суммы ввозных </xsl:text>
										<xsl:text>таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты, в виде количества календарных дней </xsl:text>
										<xsl:text>нарастающим итогом начиная со следующего дня после даты выпуска товаров. Общее количество календарных дней, </xsl:text>
										<xsl:text>в течение которых будет осуществляться выплата суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена </xsl:text>
										<xsl:text>рассрочка уплаты, по строке "Итого" не должно превышать количества календарных дней, составляющих полное число месяцев, </xsl:text>
										<xsl:text>указанных в заявлении о предоставлении рассрочки уплаты ввозных таможенных пошлин и (или) налогов.</xsl:text>
									</td>
								</tr>
								<tr>
									<td colspan="3" align="right" class="graphLittle" style="text-indent: 5%; text-align: justify;"><sup>2</sup>&#160;&#160;
										<xsl:text>Указывается доля ввозных таможенных пошлин и (или) налогов, подлежащих уплате в каждом периоде, в виде полного числа процентов </xsl:text>
										<xsl:text>от общей суммы ввозных таможенных пошлин и (или) налогов, на которую предоставлена рассрочка уплаты при выпуске товаров. </xsl:text>
										<xsl:text>Указание десятичных знаков при заполнении данного раздела не допускается. Сумма долей ввозных таможенных пошлин и (или) налогов, </xsl:text>
										<xsl:text>указанных в графе, по строке "Итого" должна составлять 100 (сто) процентов.</xsl:text>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</xsl:if>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="adicd:Applicant">
		<xsl:if test="cat_ru:OrganizationName">
			<xsl:value-of select="cat_ru:OrganizationName"/>
		</xsl:if>
		<xsl:if test="cat_ru:ShortName">
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<xsl:value-of select="cat_ru:ShortName"/>
			<xsl:if test="string-length(cat_ru:OrganizationName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:apply-templates select="cat_ru:RFOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RKOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RBOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:RAOrganizationFeatures"/>
		<xsl:apply-templates select="cat_ru:KGOrganizationFeatures"/>
		<xsl:if test="RUScat_ru:CountryA2Code">
			<span class="normal">, </span>
			<span class="italic">Код страны</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:CountryA2Code"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeCode">
			<xsl:apply-templates select="RUScat_ru:BusinessEntityTypeCode"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:BusinessEntityTypeName">
			<span class="normal">, </span>
			<span class="italic">ОПФ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:BusinessEntityTypeName"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:UITN">
			<xsl:apply-templates select="RUScat_ru:UITN"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:PersonId">
			<span class="normal">, </span>
			<span class="italic">УИ ФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="RUScat_ru:PersonId"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:IdentityCard">
			<xsl:apply-templates select="RUScat_ru:IdentityCard"/>
		</xsl:if>
		<xsl:if test="RUScat_ru:CommunicationDetails">
			<span class="normal">
				<xsl:for-each select="RUScat_ru:CommunicationDetails">
					<xsl:call-template name="CommunicationDetails"/>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RFOrganizationFeatures">
		<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">
			<span class="italic">
				<xsl:if test="string-length(cat_ru:INN) &gt; 0">
					<span class="italic">ИНН</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:INN) &gt; 0 and string-length(cat_ru:KPP) &gt; 0">
					<span class="normal">/</span>
				</xsl:if>
				<xsl:if test="string-length(cat_ru:KPP) &gt; 0">
					<span class="italic">КПП</span>
				</xsl:if>
				<span class="normal">: </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:INN">
			<xsl:value-of select="cat_ru:INN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KPP">
			<xsl:if test="string-length(cat_ru:INN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:value-of select="cat_ru:KPP"/>
		</xsl:if>
		<xsl:if test="cat_ru:OGRN">&#160;<xsl:if test="string-length(cat_ru:INN) &gt; 0 or string-length(cat_ru:KPP) &gt; 0">, </xsl:if>
			<span class="italic">ОГРН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:OGRN"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RKOrganizationFeatures">
		<xsl:if test="cat_ru:BIN">
			<br/>
			<span class="italic">БИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:BIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:IIN">
			<xsl:if test="string-length(cat_ru:BIN) &gt; 0">
				<span class="normal"> / </span>
			</xsl:if>
			<xsl:if test="string-length(cat_ru:BIN) = 0">
				<br/>
			</xsl:if>
			<span class="italic">ИИН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:IIN"/>
		</xsl:if>
		<xsl:if test="cat_ru:ITN">
			<br/>
			<span class="italic">ИТН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:CategoryCode"/>
			<span class="normal"> / </span>
			<xsl:value-of select="cat_ru:KATOCode"/>
			<xsl:if test="cat_ru:RNN">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:RNN"/>
			</xsl:if>
			<xsl:if test="cat_ru:ITNReserv">
				<span class="normal"> / </span>
				<xsl:value-of select="cat_ru:ITNReserv"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RBOrganizationFeatures">
		<xsl:if test="cat_ru:UNP">
			<br/>
			<span class="italic">УНП</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNP"/>
		</xsl:if>
		<xsl:if test="cat_ru:RBIdentificationNumber">
			<br/>
			<span class="italic">ИНФЛ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:RBIdentificationNumber"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:RAOrganizationFeatures">
		<xsl:if test="cat_ru:UNN">
			<br/>
			<span class="italic">УНН</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:UNN"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceNumber">
			<br/>
			<span class="italic">НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceNumber"/>
		</xsl:if>
		<xsl:if test="cat_ru:SocialServiceCertificate">
			<br/>
			<span class="italic">№ справки об отсутв. НЗОУ</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:SocialServiceCertificate"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="cat_ru:KGOrganizationFeatures">
		<xsl:if test="cat_ru:KGINN">
			<br/>
			<span class="italic">ИНН(ПИН)</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGINN"/>
		</xsl:if>
		<xsl:if test="cat_ru:KGOKPO">
			<br/>
			<span class="italic">ОКПО</span>
			<span class="normal">: </span>
			<xsl:value-of select="cat_ru:KGOKPO"/>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:UITN">
		<span class="normal">, </span>
		<span class="italic"> УИТН</span>
		<span class="normal">: </span>
		<xsl:value-of select="RUScat_ru:UITNCode"/>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">(</span>
			<span class="italic">страна </span>
			<xsl:value-of select="RUScat_ru:CountryCode"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="CommunicationDetails">
		<span class="normal">, </span>
		<span class="italic">Контактные данные</span>
		<span class="normal">: </span>
		<xsl:variable name="temp">
			<xsl:call-template name="RUScat_ru:CommunicationDetails"/>
		</xsl:variable>
		<xsl:value-of select="substring($temp,1,string-length($temp)-2)"/>
	</xsl:template>
	<xsl:template name="RUScat_ru:CommunicationDetails" match="RUScat_ru:CommunicationDetails">
		<xsl:if test="cat_ru:Phone">
			<span class="italic">Тел</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:Phone">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Fax">
			<span class="italic">Факс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Fax"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:Telex">
			<span class="italic">Телекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:Telex"/>
				<span class="normal">, </span>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:E_mail">
			<span class="italic">Email</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:for-each select="cat_ru:E_mail">
					<xsl:value-of select="."/>
					<span class="normal">, </span>
				</xsl:for-each>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:BusinessEntityTypeCode">
		<span class="normal">, </span>
		<span class="italic">Код ОПФ: </span>
		<xsl:value-of select="RUScat_ru:UnifiedCode"/>
		<xsl:if test="RUScat_ru:CodeListId">
			<span class="normal"> (</span>
			<span class="italic">по справ. </span>
			<xsl:value-of select="RUScat_ru:CodeListId"/>
			<span class="normal">)</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="RUScat_ru:IdentityCard">
		<span class="normal">, </span>
		<span class="italic">Документ, удостоверяющий личность ФЛ</span>
		<span class="normal">: </span>
		<xsl:if test="cat_ru:IdentityCardCode">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardCode"/>
			</span>
			<span class="normal">&#160;</span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardName">
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:FullIdentityCardName">
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal"> (</span>
			</xsl:if>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:FullIdentityCardName"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardName) &gt; 0">
				<span class="normal">)</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardSeries">
			<span class="italic">серия</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardSeries"/>
			</span>
			<xsl:if test="string-length(cat_ru:IdentityCardNumber) &gt; 0">
				<span class="normal">&#160;</span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardNumber">
			<span class="italic">№</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="cat_ru:IdentityCardNumber"/>
			</span>
		</xsl:if>
		<xsl:if test="string-length(cat_ru:IdentityCardDate) &gt; 0 or string-length(cat_ru:OrganizationName) &gt; 0">
			<!--xsl:if test="string-length(cat_ru:IdentityCardSeries) &gt; 0 or string-length(cat_ru:IdentityCardNumber) &gt; 0">
			<span class="normal">, </span>
		</xsl:if-->
			<span class="normal">, </span>
			<span class="italic">выдан</span>
			<span class="normal">: </span>
		</xsl:if>
		<xsl:if test="cat_ru:IdentityCardDate">
			<span class="normal">
				<xsl:call-template name="russian_date">
					<xsl:with-param name="dateIn" select="cat_ru:IdentityCardDate"/>
				</xsl:call-template>
			</span>
		</xsl:if>
		<xsl:if test="cat_ru:OrganizationName">
			<span class="normal">&#160;</span>
			<span class="normal">
				<xsl:value-of select="cat_ru:OrganizationName"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:IssuerCode">
			<span class="normal">, </span>
			<span class="italic">код подразделения</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:IssuerCode"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:AuthorityId">
			<span class="normal">, </span>
			<span class="italic">идентификатор организации</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AuthorityId"/>
			</span>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">, </span>
			<span class="italic">страна в уд.личности</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template name="RUScat_ru:SubjectAddressDetails" match="RUScat_ru:SubjectAddressDetails">
		<xsl:if test="RUScat_ru:PostalCode">
			<span class="italic">почтовый индекс</span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostalCode"/>
			</span>
			<xsl:if test="RUScat_ru:CountryCode or RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CountryCode">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CountryCode"/>
			</span>
			<xsl:if test="RUScat_ru:CounryName or RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:CounryName">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:CounryName"/>
			</span>
			<xsl:if test="RUScat_ru:Region or RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Region">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Region"/>
			</span>
			<xsl:if test="RUScat_ru:District or RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:District">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:District"/>
			</span>
			<xsl:if test="RUScat_ru:Town or RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Town">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Town"/>
			</span>
			<xsl:if test="RUScat_ru:City or RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:City">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:City"/>
			</span>
			<xsl:if test="RUScat_ru:StreetHouse or RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:StreetHouse">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:StreetHouse"/>
			</span>
			<xsl:if test="RUScat_ru:House or RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:House">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:House"/>
			</span>
			<xsl:if test="RUScat_ru:Room or RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:Room">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:Room"/>
			</span>
			<xsl:if test="RUScat_ru:AddressText or RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AddressText">
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AddressText"/>
			</span>
			<xsl:if test="RUScat_ru:OKTMO or RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKTMO">
			<span class="italic">ОКТМО </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKTMO"/>
			</span>
			<xsl:if test="RUScat_ru:OKATO or RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:OKATO">
			<span class="italic">OKАTO </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:OKATO"/>
			</span>
			<xsl:if test="RUScat_ru:KLADR or RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:KLADR">
			<span class="italic">КЛАДР </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:KLADR"/>
			</span>
			<xsl:if test="RUScat_ru:AOGUID or RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:AOGUID">
			<span class="italic">Глобальный идентификатор адресного объекта по ФИАС </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:AOGUID"/>
			</span>
			<xsl:if test="RUScat_ru:TerritoryCode or RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:TerritoryCode">
			<span class="italic">Код единицы административно-территориального деления </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:TerritoryCode"/>
			</span>
			<xsl:if test="RUScat_ru:PostOfficeBoxId">
				<span class="normal">, </span>
			</xsl:if>
		</xsl:if>
		<xsl:if test="RUScat_ru:PostOfficeBoxId">
			<span class="italic">а/я </span>
			<span class="normal">: </span>
			<span class="normal">
				<xsl:value-of select="RUScat_ru:PostOfficeBoxId"/>
			</span>
		</xsl:if>
	</xsl:template>
	<xsl:template match="adicd:CustomsReceiptID">
		<xsl:value-of select="cat_ru:CustomsCode"/>
		<xsl:text>/</xsl:text>
		<xsl:call-template name="gtd_date">
			<xsl:with-param name="dateIn" select="cat_ru:RegistrationDate"/>
		</xsl:call-template>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="adicd:DocNumberPrefix"/>
		<xsl:text>-</xsl:text>
		<xsl:value-of select="cat_ru:GTDNumber"/>
	</xsl:template>
	<xsl:template name="document">
		<xsl:value-of select="cat_ru:PrDocumentName"/> от <xsl:call-template name="russian_date">
			<xsl:with-param select="cat_ru:PrDocumentDate" name="dateIn"/>
		</xsl:call-template> №  <xsl:value-of select="cat_ru:PrDocumentNumber"/>
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
		<xsl:param name="dateIn"/>
		<xsl:choose>
			<xsl:when test="substring($dateIn,5,1)='-' and substring($dateIn,8,1)='-'">
				<span class="normal">
					<xsl:value-of select="substring($dateIn,9,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,6,2)"/>
				</span>
				<span class="normal">.</span>
				<span class="normal">
					<xsl:value-of select="substring($dateIn,1,4)"/>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$dateIn"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Date">
		<xsl:param name="date"/>
		<table>
			<tbody align="center" class="graphMain">
				<tr>
					<td width="2%" align="right">" </td>
					<td width="13%" class="border_bottom">
						<xsl:value-of select="substring($date,9,2)"/>
					</td>
					<td width="2%" align="left"> "</td>
					<td width="3%"> </td>
					<td width="58%" class="border_bottom">
						<xsl:variable name="month" select="substring($date, 6, 2)"/>
						<xsl:choose>
							<xsl:when test="$month=1">января</xsl:when>
							<xsl:when test="$month=2">февраля</xsl:when>
							<xsl:when test="$month=3">марта</xsl:when>
							<xsl:when test="$month=4">апреля</xsl:when>
							<xsl:when test="$month=5">мая</xsl:when>
							<xsl:when test="$month=6">июня</xsl:when>
							<xsl:when test="$month=7">июля</xsl:when>
							<xsl:when test="$month=8">августа</xsl:when>
							<xsl:when test="$month=9">сентября</xsl:when>
							<xsl:when test="$month=10">октября</xsl:when>
							<xsl:when test="$month=11">ноября</xsl:when>
							<xsl:when test="$month=12">декабря</xsl:when>
						</xsl:choose> 					
					</td>
					<td width="5%"> </td>
					<td width="2%" align="right">20</td>
					<td width="9%" class="border_bottom" align="left">
						<xsl:value-of select="substring($date,3,2)"/>
					</td>
					<td width="4%"> </td>
					<td width="2%"> г.</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
	<xsl:template name="DateStr">
		<xsl:param name="date"/>
		<xsl:choose>
			<xsl:when test="string-length($date) &gt; 0">
				<xsl:variable name="month" select="substring($date, 6, 2)"/>
				&#34;&#160;<u>&#160;<xsl:value-of select="substring($date,9,2)"/>&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;
				<xsl:choose>
						<xsl:when test="$month=1">января</xsl:when>
						<xsl:when test="$month=2">февраля</xsl:when>
						<xsl:when test="$month=3">марта</xsl:when>
						<xsl:when test="$month=4">апреля</xsl:when>
						<xsl:when test="$month=5">мая</xsl:when>
						<xsl:when test="$month=6">июня</xsl:when>
						<xsl:when test="$month=7">июля</xsl:when>
						<xsl:when test="$month=8">августа</xsl:when>
						<xsl:when test="$month=9">сентября</xsl:when>
						<xsl:when test="$month=10">октября</xsl:when>
						<xsl:when test="$month=11">ноября</xsl:when>
						<xsl:when test="$month=12">декабря</xsl:when>
					</xsl:choose> 					
				&#160;</u>&#160;&#160;<xsl:value-of select="substring($date,1,2)"/><u>
					<xsl:value-of select="substring($date,3,2)"/>&#160;</u>&#160;г.&#160;
			</xsl:when>
			<xsl:otherwise>
				&#34;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#34;
				&#160;&#160;<u>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</u>&#160;&#160;
				20<u>&#160;&#160;&#160;&#160;&#160;</u>&#160;г.&#160;
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="Goods">
		<xsl:for-each select="adicd:GoodsDescription">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">&#160;</xsl:if>
		</xsl:for-each>
		<xsl:if test="adicd:GoodsTNVEDCode"> (</xsl:if>
		<xsl:value-of select="adicd:GoodsTNVEDCode"/>
		<xsl:if test="adicd:GoodsTNVEDCode">)</xsl:if>
		<xsl:if test="position()!=last()">;&#160;</xsl:if>
	</xsl:template>
</xsl:stylesheet>
