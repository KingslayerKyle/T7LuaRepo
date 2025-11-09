local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false ), "progress", false )
end

local PostLoadFunc = function ( self, controller, menu )
	local f2_local0 = Engine.GetCurrentModeDownloadProgress()
	if f2_local0 < 1 or PlayGoIsStillDownloading() then
		self:addElement( LUI.UITimer.newElementTimer( 1000, false, function ()
			f2_local0 = Engine.GetCurrentModeDownloadProgress()
			local f3_local0 = Engine.GetCurrentModeDownloadString()
			local f3_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false )
			local f3_local2 = Engine.CreateModel( f3_local1, "progress", false )
			local f3_local3 = Engine.CreateModel( f3_local1, "chunk", false )
			Engine.SetModelValue( f3_local2, f2_local0 )
			Engine.SetModelValue( f3_local3, f3_local0 )
			if PlayGoIsStillDownloading() == false then
				Engine.SetModelValue( f3_local2, 1 )
				self:close()
			end
		end, self ) )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false ), "progress", false ), 1 )
	end
end

CoD.PlayGoDownloadProgressBar = InheritFrom( LUI.UIElement )
CoD.PlayGoDownloadProgressBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayGoDownloadProgressBar )
	self.id = "PlayGoDownloadProgressBar"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 20 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 300 )
	BG:setTopBottom( true, false, 0, 20 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local progress = LUI.UIImage.new()
	progress:setLeftRight( true, true, 0, 0 )
	progress:setTopBottom( true, false, 3, 17 )
	progress:setRGB( 1, 0.35, 0 )
	progress:setAlpha( 0 )
	progress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	progress:setShaderVector( 1, 0, 0, 0, 0 )
	progress:setShaderVector( 2, 0, 1, 0, 0 )
	progress:setShaderVector( 3, 0.1, 0.1, 0, 0 )
	progress:subscribeToGlobalModel( controller, "PlayGoDownloadProgress", "progress", function ( model )
		local _progress = Engine.GetModelValue( model )
		if _progress then
			progress:setShaderVector( 0, SwapVectorComponents( 1, 2, CoD.GetVectorComponentFromString( _progress, 1 ), CoD.GetVectorComponentFromString( _progress, 2 ), CoD.GetVectorComponentFromString( _progress, 3 ), CoD.GetVectorComponentFromString( _progress, 4 ) ) )
		end
	end )
	self:addElement( progress )
	self.progress = progress
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BG:completeAnimation()
				self.BG:setAlpha( 0 )
				self.clipFinished( BG, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 0 )
				self.clipFinished( progress, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BG:completeAnimation()
				self.BG:setAlpha( 0.2 )
				self.clipFinished( BG, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 1 )
				self.clipFinished( progress, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return PlayGoIsStillDownloading( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress.progress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PlayGoDownloadProgress.progress"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.progress:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

