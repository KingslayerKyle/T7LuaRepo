-- 2f27eda8b3eaf0fb6ace106bde93d5c8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.FocusWidget_BG" )
require( "ui.uieditor.widgets.Terminal.FocusWidgetWhiteBars" )

CoD.EntryModsLoad = InheritFrom( LUI.UIElement )
CoD.EntryModsLoad.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EntryModsLoad )
	self.id = "EntryModsLoad"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FocusWidgetBG1 = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG1:setLeftRight( true, true, 0, 0 )
	FocusWidgetBG1:setTopBottom( true, false, 0, 24 )
	self:addElement( FocusWidgetBG1 )
	self.FocusWidgetBG1 = FocusWidgetBG1
	
	local FocusWidgetBG2 = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG2:setLeftRight( true, true, 0, 0 )
	FocusWidgetBG2:setTopBottom( true, false, 0, 24 )
	self:addElement( FocusWidgetBG2 )
	self.FocusWidgetBG2 = FocusWidgetBG2
	
	local FocusWidgetWhiteBars = CoD.FocusWidgetWhiteBars.new( menu, controller )
	FocusWidgetWhiteBars:setLeftRight( true, true, -0.32, 0.68 )
	FocusWidgetWhiteBars:setTopBottom( true, false, -3.42, 3.42 )
	self:addElement( FocusWidgetWhiteBars )
	self.FocusWidgetWhiteBars = FocusWidgetWhiteBars
	
	local FocusWidgetWhiteBars0 = CoD.FocusWidgetWhiteBars.new( menu, controller )
	FocusWidgetWhiteBars0:setLeftRight( true, true, -0.32, 0.68 )
	FocusWidgetWhiteBars0:setTopBottom( true, false, 20, 26.84 )
	self:addElement( FocusWidgetWhiteBars0 )
	self.FocusWidgetWhiteBars0 = FocusWidgetWhiteBars0
	
	local ModName = LUI.UIText.new()
	ModName:setLeftRight( true, false, 9, 590 )
	ModName:setTopBottom( true, false, 0, 21 )
	ModName:setTTF( "fonts/default.ttf" )
	ModName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ModName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ModName )
	self.ModName = ModName
	
	self.ModName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			ModName:setText( Engine.Localize( name ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FocusWidgetBG1:completeAnimation()
				self.FocusWidgetBG1:setAlpha( 0 )
				self.clipFinished( FocusWidgetBG1, {} )
				FocusWidgetBG2:completeAnimation()
				self.FocusWidgetBG2:setAlpha( 0 )
				self.clipFinished( FocusWidgetBG2, {} )
				FocusWidgetWhiteBars:completeAnimation()
				self.FocusWidgetWhiteBars:setAlpha( 0 )
				self.clipFinished( FocusWidgetWhiteBars, {} )
				FocusWidgetWhiteBars0:completeAnimation()
				self.FocusWidgetWhiteBars0:setAlpha( 0 )
				self.clipFinished( FocusWidgetWhiteBars0, {} )
				ModName:completeAnimation()
				self.ModName:setRGB( 1, 1, 1 )
				self.clipFinished( ModName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusWidgetBG1:completeAnimation()
				self.FocusWidgetBG1:setAlpha( 1 )
				self.clipFinished( FocusWidgetBG1, {} )
				FocusWidgetBG2:completeAnimation()
				self.FocusWidgetBG2:setAlpha( 1 )
				self.clipFinished( FocusWidgetBG2, {} )
				FocusWidgetWhiteBars:completeAnimation()
				self.FocusWidgetWhiteBars:setAlpha( 1 )
				self.clipFinished( FocusWidgetWhiteBars, {} )
				FocusWidgetWhiteBars0:completeAnimation()
				self.FocusWidgetWhiteBars0:setAlpha( 1 )
				self.clipFinished( FocusWidgetWhiteBars0, {} )
				ModName:completeAnimation()
				self.ModName:setRGB( 1, 1, 1 )
				self.clipFinished( ModName, {} )
			end
		},
		Loaded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				FocusWidgetBG1:completeAnimation()
				self.FocusWidgetBG1:setAlpha( 0 )
				self.clipFinished( FocusWidgetBG1, {} )
				FocusWidgetBG2:completeAnimation()
				self.FocusWidgetBG2:setAlpha( 0 )
				self.clipFinished( FocusWidgetBG2, {} )
				FocusWidgetWhiteBars:completeAnimation()
				self.FocusWidgetWhiteBars:setAlpha( 0 )
				self.clipFinished( FocusWidgetWhiteBars, {} )
				FocusWidgetWhiteBars0:completeAnimation()
				self.FocusWidgetWhiteBars0:setLeftRight( true, true, -0.32, 0.68 )
				self.FocusWidgetWhiteBars0:setTopBottom( true, false, 20.58, 27.42 )
				self.FocusWidgetWhiteBars0:setAlpha( 0 )
				self.clipFinished( FocusWidgetWhiteBars0, {} )
				ModName:completeAnimation()
				self.ModName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( ModName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusWidgetBG1:completeAnimation()
				self.FocusWidgetBG1:setAlpha( 1 )
				self.clipFinished( FocusWidgetBG1, {} )
				FocusWidgetBG2:completeAnimation()
				self.FocusWidgetBG2:setAlpha( 1 )
				self.clipFinished( FocusWidgetBG2, {} )
				FocusWidgetWhiteBars:completeAnimation()
				self.FocusWidgetWhiteBars:setAlpha( 1 )
				self.clipFinished( FocusWidgetWhiteBars, {} )
				FocusWidgetWhiteBars0:completeAnimation()
				self.FocusWidgetWhiteBars0:setAlpha( 1 )
				self.clipFinished( FocusWidgetWhiteBars0, {} )
				ModName:completeAnimation()
				self.ModName:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( ModName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loaded",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "ugcName", Mods_UsingModsUgcName() )
			end
		}
	} )
	self:linkToElementModel( self, "ugcName", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ugcName"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusWidgetBG1:close()
		element.FocusWidgetBG2:close()
		element.FocusWidgetWhiteBars:close()
		element.FocusWidgetWhiteBars0:close()
		element.ModName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

