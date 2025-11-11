require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreen_DoubleXPWidget" )
require( "ui.uieditor.widgets.StartGameFlow.GameTypeAndMapNameWidgetContainer" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetElemSide" )
require( "ui.uieditor.widgets.StartGameFlow.TipWidget" )

CoD.LoadingScreenHeaderFooter = InheritFrom( LUI.UIElement )
CoD.LoadingScreenHeaderFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenHeaderFooter )
	self.id = "LoadingScreenHeaderFooter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local LoadingImage = LUI.UIImage.new()
	LoadingImage:setLeftRight( 0, 1, -162, 152 )
	LoadingImage:setTopBottom( 1, 1, -98, 162 )
	LoadingImage:setRGB( 0, 0, 0 )
	LoadingImage:setAlpha( 0.8 )
	self:addElement( LoadingImage )
	self.LoadingImage = LoadingImage
	
	local LoadingElem2 = CoD.TeamIconAndNameWidgetElemSide.new( menu, controller )
	LoadingElem2:setLeftRight( 1, 1, -101, -58 )
	LoadingElem2:setTopBottom( 1, 1, -69, -29 )
	LoadingElem2:setYRot( -180 )
	self:addElement( LoadingElem2 )
	self.LoadingElem2 = LoadingElem2
	
	local LoadingElem1 = CoD.TeamIconAndNameWidgetElemSide.new( menu, controller )
	LoadingElem1:setLeftRight( 0, 0, 59, 103 )
	LoadingElem1:setTopBottom( 1, 1, -70, -30 )
	self:addElement( LoadingElem1 )
	self.LoadingElem1 = LoadingElem1
	
	local LoadingBar = LUI.UIImage.new()
	LoadingBar:setLeftRight( 0, 1, 96, -94 )
	LoadingBar:setTopBottom( 1, 1, -44, -32 )
	LoadingBar:setRGB( 1, 0.35, 0 )
	LoadingBar:setImage( RegisterImage( "uie_t7_mp_menu_startflow_meterfill" ) )
	LoadingBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	LoadingBar:setShaderVector( 1, 0, 0, 0, 0 )
	LoadingBar:setShaderVector( 2, 1, 0, 0, 0 )
	LoadingBar:setShaderVector( 3, 0, 0, 0, 0 )
	LoadingBar:setShaderVector( 4, 1, 0.05, 1, 0.05 )
	LoadingBar:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "loadedFraction", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( LoadingBar )
	self.LoadingBar = LoadingBar
	
	local LoadingLine3 = LUI.UIImage.new()
	LoadingLine3:setLeftRight( 0, 1, 98, -96 )
	LoadingLine3:setTopBottom( 1, 1, -38, -26 )
	LoadingLine3:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine3:setAlpha( 0.9 )
	LoadingLine3:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine3 )
	self.LoadingLine3 = LoadingLine3
	
	local LoadingLine2 = LUI.UIImage.new()
	LoadingLine2:setLeftRight( 0, 1, 98, -96 )
	LoadingLine2:setTopBottom( 1, 1, -50, -38 )
	LoadingLine2:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine2:setAlpha( 0.9 )
	LoadingLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine2 )
	self.LoadingLine2 = LoadingLine2
	
	local HeaderTip = CoD.TipWidget.new( menu, controller )
	HeaderTip:setLeftRight( 0, 0, 80, 2000 )
	HeaderTip:setTopBottom( 1, 1, -102, -30 )
	self:addElement( HeaderTip )
	self.HeaderTip = HeaderTip
	
	local HeaderImage = LUI.UIImage.new()
	HeaderImage:setLeftRight( 0, 1, -162, 152 )
	HeaderImage:setTopBottom( 0, 0, -158, 102 )
	HeaderImage:setRGB( 0, 0, 0 )
	HeaderImage:setAlpha( 0.8 )
	self:addElement( HeaderImage )
	self.HeaderImage = HeaderImage
	
	local HeaderTitle = CoD.GameTypeAndMapNameWidgetContainer.new( menu, controller )
	HeaderTitle:setLeftRight( 0, 0, 182, 1910 )
	HeaderTitle:setTopBottom( 0, 0, 18, 90 )
	self:addElement( HeaderTitle )
	self.HeaderTitle = HeaderTitle
	
	local GameTypeIcon = LUI.UIImage.new()
	GameTypeIcon:setLeftRight( 0, 0, 96, 169 )
	GameTypeIcon:setTopBottom( 0, 0, 22, 95 )
	GameTypeIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameTypeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameTypeIcon )
	self.GameTypeIcon = GameTypeIcon
	
	local LoadingScreenDoubleXPWidget = CoD.LoadingScreen_DoubleXPWidget.new( menu, controller )
	LoadingScreenDoubleXPWidget:setLeftRight( 1, 1, -637, -154 )
	LoadingScreenDoubleXPWidget:setTopBottom( 0, 0, 56, 90 )
	self:addElement( LoadingScreenDoubleXPWidget )
	self.LoadingScreenDoubleXPWidget = LoadingScreenDoubleXPWidget
	
	self.resetProperties = function ()
		GameTypeIcon:completeAnimation()
		HeaderTitle:completeAnimation()
		LoadingBar:completeAnimation()
		LoadingElem1:completeAnimation()
		LoadingElem2:completeAnimation()
		LoadingLine3:completeAnimation()
		LoadingLine2:completeAnimation()
		HeaderTip:completeAnimation()
		LoadingImage:completeAnimation()
		HeaderImage:completeAnimation()
		LoadingScreenDoubleXPWidget:completeAnimation()
		GameTypeIcon:setAlpha( 1 )
		HeaderTitle:setAlpha( 1 )
		LoadingBar:setAlpha( 1 )
		LoadingElem1:setAlpha( 1 )
		LoadingElem2:setAlpha( 1 )
		LoadingLine3:setAlpha( 0.9 )
		LoadingLine2:setAlpha( 0.9 )
		HeaderTip:setAlpha( 1 )
		LoadingImage:setLeftRight( 0, 1, -162, 152 )
		LoadingImage:setTopBottom( 1, 1, -98, 162 )
		HeaderImage:setLeftRight( 0, 1, -162, 152 )
		HeaderImage:setTopBottom( 0, 0, -158, 102 )
		HeaderImage:setAlpha( 0.8 )
		LoadingScreenDoubleXPWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				local LoadingImageFrame2 = function ( LoadingImage, event )
					local LoadingImageFrame3 = function ( LoadingImage, event )
						local LoadingImageFrame4 = function ( LoadingImage, event )
							local LoadingImageFrame5 = function ( LoadingImage, event )
								if not event.interrupted then
									LoadingImage:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
								end
								LoadingImage:setLeftRight( 0, 1, -162, 152 )
								LoadingImage:setTopBottom( 1, 1, -98, 162 )
								if event.interrupted then
									self.clipFinished( LoadingImage, event )
								else
									LoadingImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LoadingImageFrame5( LoadingImage, event )
								return 
							else
								LoadingImage:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								LoadingImage:registerEventHandler( "transition_complete_keyframe", LoadingImageFrame5 )
							end
						end
						
						if event.interrupted then
							LoadingImageFrame4( LoadingImage, event )
							return 
						else
							LoadingImage:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
							LoadingImage:setTopBottom( 1, 1, -98, 162 )
							LoadingImage:registerEventHandler( "transition_complete_keyframe", LoadingImageFrame4 )
						end
					end
					
					if event.interrupted then
						LoadingImageFrame3( LoadingImage, event )
						return 
					else
						LoadingImage:beginAnimation( "keyframe", 1809, false, false, CoD.TweenType.Linear )
						LoadingImage:registerEventHandler( "transition_complete_keyframe", LoadingImageFrame3 )
					end
				end
				
				LoadingImage:completeAnimation()
				self.LoadingImage:setLeftRight( 0, 1, -162, 152 )
				self.LoadingImage:setTopBottom( 1, 1, 16, 246 )
				LoadingImageFrame2( LoadingImage, {} )
				local LoadingElem2Frame2 = function ( LoadingElem2, event )
					local LoadingElem2Frame3 = function ( LoadingElem2, event )
						if not event.interrupted then
							LoadingElem2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingElem2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem2, event )
						else
							LoadingElem2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem2Frame3( LoadingElem2, event )
						return 
					else
						LoadingElem2:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingElem2:registerEventHandler( "transition_complete_keyframe", LoadingElem2Frame3 )
					end
				end
				
				LoadingElem2:completeAnimation()
				self.LoadingElem2:setAlpha( 0 )
				LoadingElem2Frame2( LoadingElem2, {} )
				local LoadingElem1Frame2 = function ( LoadingElem1, event )
					local LoadingElem1Frame3 = function ( LoadingElem1, event )
						if not event.interrupted then
							LoadingElem1:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingElem1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingElem1, event )
						else
							LoadingElem1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingElem1Frame3( LoadingElem1, event )
						return 
					else
						LoadingElem1:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingElem1:registerEventHandler( "transition_complete_keyframe", LoadingElem1Frame3 )
					end
				end
				
				LoadingElem1:completeAnimation()
				self.LoadingElem1:setAlpha( 0 )
				LoadingElem1Frame2( LoadingElem1, {} )
				local LoadingBarFrame2 = function ( LoadingBar, event )
					local LoadingBarFrame3 = function ( LoadingBar, event )
						if not event.interrupted then
							LoadingBar:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingBar:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingBar, event )
						else
							LoadingBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingBarFrame3( LoadingBar, event )
						return 
					else
						LoadingBar:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingBar:registerEventHandler( "transition_complete_keyframe", LoadingBarFrame3 )
					end
				end
				
				LoadingBar:completeAnimation()
				self.LoadingBar:setAlpha( 0 )
				LoadingBarFrame2( LoadingBar, {} )
				local LoadingLine3Frame2 = function ( LoadingLine3, event )
					local LoadingLine3Frame3 = function ( LoadingLine3, event )
						if not event.interrupted then
							LoadingLine3:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingLine3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingLine3, event )
						else
							LoadingLine3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine3Frame3( LoadingLine3, event )
						return 
					else
						LoadingLine3:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingLine3:registerEventHandler( "transition_complete_keyframe", LoadingLine3Frame3 )
					end
				end
				
				LoadingLine3:completeAnimation()
				self.LoadingLine3:setAlpha( 0 )
				LoadingLine3Frame2( LoadingLine3, {} )
				local LoadingLine2Frame2 = function ( LoadingLine2, event )
					local LoadingLine2Frame3 = function ( LoadingLine2, event )
						if not event.interrupted then
							LoadingLine2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						LoadingLine2:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingLine2, event )
						else
							LoadingLine2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingLine2Frame3( LoadingLine2, event )
						return 
					else
						LoadingLine2:beginAnimation( "keyframe", 2240, false, false, CoD.TweenType.Linear )
						LoadingLine2:registerEventHandler( "transition_complete_keyframe", LoadingLine2Frame3 )
					end
				end
				
				LoadingLine2:completeAnimation()
				self.LoadingLine2:setAlpha( 0 )
				LoadingLine2Frame2( LoadingLine2, {} )
				local HeaderTipFrame2 = function ( HeaderTip, event )
					local HeaderTipFrame3 = function ( HeaderTip, event )
						if not event.interrupted then
							HeaderTip:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
						end
						HeaderTip:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderTip, event )
						else
							HeaderTip:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderTipFrame3( HeaderTip, event )
						return 
					else
						HeaderTip:beginAnimation( "keyframe", 2099, false, false, CoD.TweenType.Linear )
						HeaderTip:registerEventHandler( "transition_complete_keyframe", HeaderTipFrame3 )
					end
				end
				
				HeaderTip:completeAnimation()
				self.HeaderTip:setAlpha( 0 )
				HeaderTipFrame2( HeaderTip, {} )
				local HeaderImageFrame2 = function ( HeaderImage, event )
					local HeaderImageFrame3 = function ( HeaderImage, event )
						if not event.interrupted then
							HeaderImage:beginAnimation( "keyframe", 600, false, false, CoD.TweenType.Linear )
						end
						HeaderImage:setLeftRight( 0, 1, -162, 152 )
						HeaderImage:setTopBottom( 0, 0, -158, 102 )
						HeaderImage:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( HeaderImage, event )
						else
							HeaderImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderImageFrame3( HeaderImage, event )
						return 
					else
						HeaderImage:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						HeaderImage:registerEventHandler( "transition_complete_keyframe", HeaderImageFrame3 )
					end
				end
				
				HeaderImage:completeAnimation()
				self.HeaderImage:setLeftRight( 0, 1, -162, 152 )
				self.HeaderImage:setTopBottom( 0, 0, -276, -18 )
				self.HeaderImage:setAlpha( 0.8 )
				HeaderImageFrame2( HeaderImage, {} )
				local HeaderTitleFrame2 = function ( HeaderTitle, event )
					local HeaderTitleFrame3 = function ( HeaderTitle, event )
						if not event.interrupted then
							HeaderTitle:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						end
						HeaderTitle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( HeaderTitle, event )
						else
							HeaderTitle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HeaderTitleFrame3( HeaderTitle, event )
						return 
					else
						HeaderTitle:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						HeaderTitle:registerEventHandler( "transition_complete_keyframe", HeaderTitleFrame3 )
					end
				end
				
				HeaderTitle:completeAnimation()
				self.HeaderTitle:setAlpha( 0 )
				HeaderTitleFrame2( HeaderTitle, {} )
				local GameTypeIconFrame2 = function ( GameTypeIcon, event )
					local GameTypeIconFrame3 = function ( GameTypeIcon, event )
						if not event.interrupted then
							GameTypeIcon:beginAnimation( "keyframe", 160, false, false, CoD.TweenType.Linear )
						end
						GameTypeIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( GameTypeIcon, event )
						else
							GameTypeIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GameTypeIconFrame3( GameTypeIcon, event )
						return 
					else
						GameTypeIcon:beginAnimation( "keyframe", 910, false, false, CoD.TweenType.Linear )
						GameTypeIcon:registerEventHandler( "transition_complete_keyframe", GameTypeIconFrame3 )
					end
				end
				
				GameTypeIcon:completeAnimation()
				self.GameTypeIcon:setAlpha( 0 )
				GameTypeIconFrame2( GameTypeIcon, {} )
				local LoadingScreenDoubleXPWidgetFrame2 = function ( LoadingScreenDoubleXPWidget, event )
					local LoadingScreenDoubleXPWidgetFrame3 = function ( LoadingScreenDoubleXPWidget, event )
						if not event.interrupted then
							LoadingScreenDoubleXPWidget:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
						end
						LoadingScreenDoubleXPWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingScreenDoubleXPWidget, event )
						else
							LoadingScreenDoubleXPWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenDoubleXPWidgetFrame3( LoadingScreenDoubleXPWidget, event )
						return 
					else
						LoadingScreenDoubleXPWidget:beginAnimation( "keyframe", 1070, false, false, CoD.TweenType.Linear )
						LoadingScreenDoubleXPWidget:registerEventHandler( "transition_complete_keyframe", LoadingScreenDoubleXPWidgetFrame3 )
					end
				end
				
				LoadingScreenDoubleXPWidget:completeAnimation()
				self.LoadingScreenDoubleXPWidget:setAlpha( 0 )
				LoadingScreenDoubleXPWidgetFrame2( LoadingScreenDoubleXPWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingElem2:close()
		self.LoadingElem1:close()
		self.HeaderTip:close()
		self.HeaderTitle:close()
		self.LoadingScreenDoubleXPWidget:close()
		self.LoadingBar:close()
		self.GameTypeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

