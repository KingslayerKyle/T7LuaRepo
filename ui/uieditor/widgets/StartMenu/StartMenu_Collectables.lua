-- 3429083ed5ba259f8e1f48ee5f5a18f5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_CollectableItem" )

CoD.StartMenu_Collectables = InheritFrom( LUI.UIElement )
CoD.StartMenu_Collectables.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Collectables )
	self.id = "StartMenu_Collectables"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 230 )
	self:setTopBottom( true, false, 0, 179 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local List = LUI.UIList.new( menu, controller, 6, 0, nil, false, false, 0, 0, false, false )
	List:makeFocusable()
	List:setLeftRight( true, false, 0, 222 )
	List:setTopBottom( true, false, 25, 171 )
	List:setWidgetType( CoD.StartMenu_CollectableItem )
	List:setHorizontalCount( 3 )
	List:setVerticalCount( 2 )
	List:setSpacing( 6 )
	List:setDataSource( "StartMenuCollectables" )
	self:addElement( List )
	self.List = List
	
	local TextBox30 = LUI.UIText.new()
	TextBox30:setLeftRight( true, false, 0, 230 )
	TextBox30:setTopBottom( true, false, 0, 22 )
	TextBox30:setRGB( 0.95, 0.89, 0.03 )
	TextBox30:setText( Engine.Localize( "MENU_COLLECTIBLES_CAPS" ) )
	TextBox30:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox30:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox30:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox30:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox30:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox30:setLetterSpacing( 2 )
	TextBox30:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox30:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox30 )
	self.TextBox30 = TextBox30
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox30:completeAnimation()
				self.TextBox30:setAlpha( 1 )
				self.clipFinished( TextBox30, {} )
			end
		},
		CP_PauseMenu = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox30:completeAnimation()
				self.TextBox30:setAlpha( 0 )
				self.clipFinished( TextBox30, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		},
		{
			stateName = "hidden",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	List.id = "List"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.List:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.List:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

