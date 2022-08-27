-- 795eb296d3b36b5cbde1e597116cc719
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.CACHeroPreviewPanelShader" )
require( "ui.uieditor.widgets.CAC.cac_CharElements" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderSmall" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleElemForeC" )

CoD.CACHeroPreviewWidget = InheritFrom( LUI.UIElement )
CoD.CACHeroPreviewWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACHeroPreviewWidget )
	self.id = "CACHeroPreviewWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 1500 )
	self:setTopBottom( true, false, 0, 138 )
	self.anyChildUsesUpdateState = true
	
	local CACHeroPreviewPanelShader0 = CoD.CACHeroPreviewPanelShader.new( menu, controller )
	CACHeroPreviewPanelShader0:setLeftRight( true, false, 1026, 1426 )
	CACHeroPreviewPanelShader0:setTopBottom( true, false, -59, 141 )
	self:addElement( CACHeroPreviewPanelShader0 )
	self.CACHeroPreviewPanelShader0 = CACHeroPreviewPanelShader0
	
	local heroImage = LUI.UIImage.new()
	heroImage:setLeftRight( false, true, -238, -110 )
	heroImage:setTopBottom( false, true, -128, 0 )
	heroImage:subscribeToGlobalModel( controller, "PerController", "CACMenu.currentHeroImage", function ( model )
		local CACMenuCurrentHeroImage = Engine.GetModelValue( model )
		if CACMenuCurrentHeroImage then
			heroImage:setImage( RegisterImage( CACMenuCurrentHeroImage ) )
		end
	end )
	self:addElement( heroImage )
	self.heroImage = heroImage
	
	local circles = LUI.UIImage.new()
	circles:setLeftRight( true, false, 1264, 1389 )
	circles:setTopBottom( true, false, 4.24, 125.76 )
	circles:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles )
	self.circles = circles
	
	local LineLongB = LUI.UIImage.new()
	LineLongB:setLeftRight( true, true, 1030, -5 )
	LineLongB:setTopBottom( false, false, 24, 28 )
	LineLongB:setAlpha( 0.5 )
	LineLongB:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	LineLongB:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLongB )
	self.LineLongB = LineLongB
	
	local LineLongT = LUI.UIImage.new()
	LineLongT:setLeftRight( true, true, 1030, -5 )
	LineLongT:setTopBottom( false, false, -34, -30 )
	LineLongT:setAlpha( 0.5 )
	LineLongT:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	LineLongT:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLongT )
	self.LineLongT = LineLongT
	
	local cacCharElements0 = CoD.cac_CharElements.new( menu, controller )
	cacCharElements0:setLeftRight( true, false, 1155, 1780 )
	cacCharElements0:setTopBottom( true, false, 24.23, 107.77 )
	cacCharElements0:setAlpha( 0.6 )
	self:addElement( cacCharElements0 )
	self.cacCharElements0 = cacCharElements0
	
	local heroWeaponName = CoD.FE_ListHeaderSmall.new( menu, controller )
	heroWeaponName:setLeftRight( true, false, 1174, 1272 )
	heroWeaponName:setTopBottom( true, false, 61, 81 )
	heroWeaponName:setRGB( 0.76, 0.76, 0.76 )
	heroWeaponName:subscribeToGlobalModel( controller, "PerController", "CACMenu.currentHeroLoadout", function ( model )
		local CACMenuCurrentHeroLoadout = Engine.GetModelValue( model )
		if CACMenuCurrentHeroLoadout then
			heroWeaponName.btnDisplayTextStroke:setText( Engine.Localize( CACMenuCurrentHeroLoadout ) )
		end
	end )
	self:addElement( heroWeaponName )
	self.heroWeaponName = heroWeaponName
	
	local heroName = LUI.UIText.new()
	heroName:setLeftRight( false, true, -303.75, -233.75 )
	heroName:setTopBottom( false, false, -31, -11 )
	heroName:setRGB( 0.76, 0.76, 0.76 )
	heroName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	heroName:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	heroName:setShaderVector( 0, 0.05, 0, 0, 0 )
	heroName:setShaderVector( 1, 0, 0, 0, 0 )
	heroName:setShaderVector( 2, 0, 0, 0, 0 )
	heroName:setShaderVector( 3, 0, 0, 0, 0 )
	heroName:setShaderVector( 4, 0, 0, 0, 0 )
	heroName:setLetterSpacing( 0.5 )
	heroName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	heroName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	heroName:subscribeToGlobalModel( controller, "PerController", "CACMenu.currentHeroName", function ( model )
		local CACMenuCurrentHeroName = Engine.GetModelValue( model )
		if CACMenuCurrentHeroName then
			heroName:setText( Engine.Localize( CACMenuCurrentHeroName ) )
		end
	end )
	self:addElement( heroName )
	self.heroName = heroName
	
	local ElemForeC0 = CoD.FE_TitleElemForeC.new( menu, controller )
	ElemForeC0:setLeftRight( true, false, 1155, 1171 )
	ElemForeC0:setTopBottom( true, false, 33.33, 98.67 )
	ElemForeC0:setAlpha( 0.5 )
	self:addElement( ElemForeC0 )
	self.ElemForeC0 = ElemForeC0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CACHeroPreviewPanelShader0:completeAnimation()
				self.CACHeroPreviewPanelShader0:setAlpha( 0 )
				self.clipFinished( CACHeroPreviewPanelShader0, {} )
				heroImage:completeAnimation()
				self.heroImage:setAlpha( 0 )
				self.clipFinished( heroImage, {} )
				circles:completeAnimation()
				self.circles:setAlpha( 0 )
				self.clipFinished( circles, {} )
			end
		},
		VisibleHero = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CACHeroPreviewPanelShader0:completeAnimation()
				self.CACHeroPreviewPanelShader0:setAlpha( 1 )
				self.clipFinished( CACHeroPreviewPanelShader0, {} )
				heroImage:completeAnimation()
				self.heroImage:setAlpha( 1 )
				self.clipFinished( heroImage, {} )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 8 )
				local CACHeroPreviewPanelShader0Frame2 = function ( CACHeroPreviewPanelShader0, event )
					local CACHeroPreviewPanelShader0Frame3 = function ( CACHeroPreviewPanelShader0, event )
						if not event.interrupted then
							CACHeroPreviewPanelShader0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						CACHeroPreviewPanelShader0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CACHeroPreviewPanelShader0, event )
						else
							CACHeroPreviewPanelShader0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CACHeroPreviewPanelShader0Frame3( CACHeroPreviewPanelShader0, event )
						return 
					else
						CACHeroPreviewPanelShader0:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						CACHeroPreviewPanelShader0:registerEventHandler( "transition_complete_keyframe", CACHeroPreviewPanelShader0Frame3 )
					end
				end
				
				CACHeroPreviewPanelShader0:completeAnimation()
				self.CACHeroPreviewPanelShader0:setAlpha( 0 )
				CACHeroPreviewPanelShader0Frame2( CACHeroPreviewPanelShader0, {} )
				local circlesFrame2 = function ( circles, event )
					if not event.interrupted then
						circles:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					circles:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( circles, event )
					else
						circles:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				circles:completeAnimation()
				self.circles:setAlpha( 0 )
				circlesFrame2( circles, {} )
				local LineLongBFrame2 = function ( LineLongB, event )
					local LineLongBFrame3 = function ( LineLongB, event )
						if not event.interrupted then
							LineLongB:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						LineLongB:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( LineLongB, event )
						else
							LineLongB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineLongBFrame3( LineLongB, event )
						return 
					else
						LineLongB:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
						LineLongB:registerEventHandler( "transition_complete_keyframe", LineLongBFrame3 )
					end
				end
				
				LineLongB:completeAnimation()
				self.LineLongB:setAlpha( 0 )
				LineLongBFrame2( LineLongB, {} )
				local LineLongTFrame2 = function ( LineLongT, event )
					if not event.interrupted then
						LineLongT:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					LineLongT:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( LineLongT, event )
					else
						LineLongT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineLongT:completeAnimation()
				self.LineLongT:setAlpha( 0 )
				LineLongTFrame2( LineLongT, {} )
				local cacCharElements0Frame2 = function ( cacCharElements0, event )
					local cacCharElements0Frame3 = function ( cacCharElements0, event )
						if not event.interrupted then
							cacCharElements0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Bounce )
						end
						cacCharElements0:setAlpha( 0.6 )
						if event.interrupted then
							self.clipFinished( cacCharElements0, event )
						else
							cacCharElements0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						cacCharElements0Frame3( cacCharElements0, event )
						return 
					else
						cacCharElements0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						cacCharElements0:registerEventHandler( "transition_complete_keyframe", cacCharElements0Frame3 )
					end
				end
				
				cacCharElements0:completeAnimation()
				self.cacCharElements0:setAlpha( 0 )
				cacCharElements0Frame2( cacCharElements0, {} )
				local heroWeaponNameFrame2 = function ( heroWeaponName, event )
					if not event.interrupted then
						heroWeaponName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
					end
					heroWeaponName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( heroWeaponName, event )
					else
						heroWeaponName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				heroWeaponName:completeAnimation()
				self.heroWeaponName:setAlpha( 0 )
				heroWeaponNameFrame2( heroWeaponName, {} )
				local heroNameFrame2 = function ( heroName, event )
					local heroNameFrame3 = function ( heroName, event )
						if not event.interrupted then
							heroName:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						heroName:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( heroName, event )
						else
							heroName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						heroNameFrame3( heroName, event )
						return 
					else
						heroName:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						heroName:registerEventHandler( "transition_complete_keyframe", heroNameFrame3 )
					end
				end
				
				heroName:completeAnimation()
				self.heroName:setAlpha( 0 )
				heroNameFrame2( heroName, {} )
				local ElemForeC0Frame2 = function ( ElemForeC0, event )
					local ElemForeC0Frame3 = function ( ElemForeC0, event )
						if not event.interrupted then
							ElemForeC0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						ElemForeC0:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( ElemForeC0, event )
						else
							ElemForeC0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ElemForeC0Frame3( ElemForeC0, event )
						return 
					else
						ElemForeC0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						ElemForeC0:registerEventHandler( "transition_complete_keyframe", ElemForeC0Frame3 )
					end
				end
				
				ElemForeC0:completeAnimation()
				self.ElemForeC0:setAlpha( 0 )
				ElemForeC0Frame2( ElemForeC0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VisibleHero",
			condition = function ( menu, element, event )
				return IsCurrentMenu( menu, "CustomClass" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACHeroPreviewPanelShader0:close()
		element.cacCharElements0:close()
		element.heroWeaponName:close()
		element.ElemForeC0:close()
		element.heroImage:close()
		element.heroName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

