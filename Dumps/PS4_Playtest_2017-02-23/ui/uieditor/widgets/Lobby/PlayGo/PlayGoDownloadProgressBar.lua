local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false )
	local progressModel = Engine.CreateModel( rootModel, "progress", false )
end

local PostLoadFunc = function ( self, controller, menu )
	local downloadProgress = Engine.GetCurrentModeDownloadProgress()
	if downloadProgress < 1 or PlayGoIsStillDownloading() then
		local progressTimer = LUI.UITimer.newElementTimer( 1000, false, function ()
			downloadProgress = Engine.GetCurrentModeDownloadProgress()
			local chunkDownloading = Engine.GetCurrentModeDownloadString()
			local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false )
			local progressModel = Engine.CreateModel( rootModel, "progress", false )
			local chunkModel = Engine.CreateModel( rootModel, "chunk", false )
			Engine.SetModelValue( progressModel, downloadProgress )
			Engine.SetModelValue( chunkModel, chunkDownloading )
			if PlayGoIsStillDownloading() == false then
				Engine.SetModelValue( progressModel, 1 )
				self:close()
			end
		end, self )
		self:addElement( progressTimer )
	else
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "PlayGoDownloadProgress", false )
		local progressModel = Engine.CreateModel( rootModel, "progress", false )
		Engine.SetModelValue( progressModel, 1 )
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
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 450 )
	BG:setTopBottom( 0, 0, 0, 30 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0 )
	self:addElement( BG )
	self.BG = BG
	
	local progress = LUI.UIImage.new()
	progress:setLeftRight( 0, 1, 0, 0 )
	progress:setTopBottom( 0, 0, 5, 26 )
	progress:setRGB( 1, 0.35, 0 )
	progress:setAlpha( 0 )
	progress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	progress:setShaderVector( 1, 0, 0, 0, 0 )
	progress:setShaderVector( 2, 0, 1, 0, 0 )
	progress:setShaderVector( 3, 0.1, 0.1, 0, 0 )
	progress:subscribeToGlobalModel( controller, "PlayGoDownloadProgress", "progress", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			progress:setShaderVector( 0, SwapVectorComponents( 1, 2, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) ) )
		end
	end )
	self:addElement( progress )
	self.progress = progress
	
	self.resetProperties = function ()
		progress:completeAnimation()
		BG:completeAnimation()
		progress:setAlpha( 0 )
		BG:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.progress:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

