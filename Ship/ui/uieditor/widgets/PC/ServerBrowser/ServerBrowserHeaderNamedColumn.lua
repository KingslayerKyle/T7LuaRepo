-- 4ceb9095b1db62cfd7e58083e92ea883
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.horizontalScrollingTextBox_14pt" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setHandleMouse( true )
	f1_arg0.setupSort = function ( f2_arg0, f2_arg1, f2_arg2 )
		f2_arg0.ascendingSort = f2_arg1
		f2_arg0.descendingSort = f2_arg2
		f1_arg0:registerEventHandler( "button_action", function ( element, event )
			if f2_arg0.ascendingSort and f2_arg0.descendingSort then
				local f3_local0 = f2_arg0.ascendingSort
				local f3_local1 = Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListSortType" )
				if f3_local1 and Engine.GetModelValue( f3_local1 ) == f2_arg0.ascendingSort then
					f3_local0 = f2_arg0.descendingSort
				end
				Engine.SteamServerBrowser_Sort( f3_local0 )
			end
		end )
	end
	
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.ServerBrowserHeaderNamedColumn = InheritFrom( LUI.UIElement )
CoD.ServerBrowserHeaderNamedColumn.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserHeaderNamedColumn )
	self.id = "ServerBrowserHeaderNamedColumn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 28 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.2, 0.2, 0.2 )
	self:addElement( background )
	self.background = background
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, true, -15, -3 )
	arrow:setTopBottom( true, false, 11, 17 )
	arrow:setAlpha( 0 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local name = CoD.horizontalScrollingTextBox_14pt.new( menu, controller )
	name:setLeftRight( true, true, 5, -15 )
	name:setTopBottom( true, false, 8, 22 )
	name.textBox:setText( Engine.Localize( "MENU_NEW" ) )
	name.textBox:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	name.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self:addElement( name )
	self.name = name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 0 )
				self.clipFinished( arrow, {} )
			end
		},
		SortAscend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.arrow:setZRot( 0 )
				self.clipFinished( arrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.arrow:setZRot( 0 )
				self.clipFinished( arrow, {} )
			end
		},
		SortDescend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.arrow:setZRot( 180 )
				self.clipFinished( arrow, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )

				arrow:completeAnimation()
				self.arrow:setAlpha( 1 )
				self.arrow:setZRot( 180 )
				self.clipFinished( arrow, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "SortAscend",
			condition = function ( menu, element, event )
				return SteamServerSortMatchesHeaderAscending( element )
			end
		},
		{
			stateName = "SortDescend",
			condition = function ( menu, element, event )
				return SteamServerSortMatchesHeaderDescending( element )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "serverBrowser.serverListSortType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "serverBrowser.serverListSortType"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.name:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
