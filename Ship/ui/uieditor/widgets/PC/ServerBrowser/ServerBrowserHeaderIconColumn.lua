-- f5950cad9a121fcc99c0c085abd35003
-- This hash is used for caching, delete to decompile the file again

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

CoD.ServerBrowserHeaderIconColumn = InheritFrom( LUI.UIElement )
CoD.ServerBrowserHeaderIconColumn.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserHeaderIconColumn )
	self.id = "ServerBrowserHeaderIconColumn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 28 )
	self:setTopBottom( true, false, 0, 28 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.2, 0.2, 0.2 )
	self:addElement( background )
	self.background = background
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, true, 0, 0 )
	icon:setTopBottom( true, true, 0, 0 )
	icon:setRGB( 0.59, 0.59, 0.59 )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				icon:completeAnimation()
				self.icon:setRGB( 0.59, 0.59, 0.59 )
				self.clipFinished( icon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )
			end
		},
		SortAscend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.clipFinished( icon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.clipFinished( icon, {} )
			end
		},
		SortDescend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.clipFinished( icon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				background:completeAnimation()
				self.background:setRGB( 1, 0.53, 0 )
				self.clipFinished( background, {} )

				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.clipFinished( icon, {} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
